part of 'two_fa_screen.dart';

class TwoFaMobileScreen extends GetView<TwoFaController> {
  const TwoFaMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.twoFaSecurity),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Column(
          children: [
            _qrcode(),
            _qrSecret(),
            _notes(),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }

  _qrcode() {
    print(controller.twoFaModel.data.qrCode);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalSize * 1.6,
        vertical: Dimensions.verticalSize * 0.6,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalSize * 1.2,
        vertical: Dimensions.verticalSize * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: CustomColor.whiteColor,
      ),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 3),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(controller.twoFaModel.data.qrCode),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _notes() {
    return TextWidget(
      controller.twoFaModel.data.alert,
      textAlign: TextAlign.center,
      typographyStyle: TypographyStyle.bodyMedium,
    );
  }

  _buttonWidget() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.verticalSize,
        ),
        child: PrimaryButton(
          title: controller.twoFaModel.data.qrStatus == 0
              ? Strings.enable
              : Strings.disable,
          isLoading: controller.isUpdateLoading,
          onPressed: () {
            controller.onUpdateTwoFaStatus;
          },
        ),
      ),
    );
  }

  _qrSecret() {
    return Column(
      children: [
        PrimaryInputWidget(
          controller: controller.qrSecretController,
          hintText: '',
          label: Strings.address,
          suffixIconPadding: EdgeInsets.zero,
          readOnly: true,
          suffixIcon: InkWell(
            onTap: () {
              Clipboard.setData(
                      ClipboardData(text: controller.qrSecretController.text))
                  .then((_) {
                CustomSnackBar.success(
                  message: Strings.copiedToClipboard,
                  title: Strings.copy,
                );
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSize * 0.8,
                horizontal: Dimensions.paddingSize * 0.8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius * 1.2),
                  bottomRight: Radius.circular(Dimensions.radius * 1.2),
                ),
                color: CustomColor.primary,
              ),
              child: Icon(
                Icons.copy,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Sizes.height.v20,
      ],
    );
  }
}
