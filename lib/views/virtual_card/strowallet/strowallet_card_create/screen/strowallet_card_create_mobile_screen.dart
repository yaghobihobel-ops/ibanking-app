part of 'strowallet_card_create_screen.dart';

class StrowalletCardCreateMobileScreen
    extends GetView<StrowalletCardCreateController> {
  StrowalletCardCreateMobileScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.createVirtualCard),
      body: Obx(
        () => controller.isLoading ||
                controller.isStatusLoading ||
                controller.isFieldLoading
            ? Loader()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = controller.strowalletCreatePageFieldModel.data.data;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: ListView(
          children: [
            if (data.customerExistStatus == false) ...[
              _customerCreate(context),
            ] else if (data.customerExistStatus == true &&
                data.customerKycStatus != 'high kyc') ...[
              _customerUpdate(context),
            ] else ...[
              StrowalletCardCreateInputWidget(),
              StrowalletCardCreatePreview(),
            ]
          ],
        ),
      ),
    );
  }

  _customerUpdate(BuildContext context) {
    var data = controller.strowalletCreatePageFieldModel.data.data;
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        color: CustomColor.primary.withOpacity(0.05),
      ),
      child: Column(
        children: [
          FittedBox(
            child: Row(
              children: [
                TextWidget(Strings.statusOfTheCustomer),
                Sizes.width.v5,
                TextWidget(
                  data.customerExist.status.toUpperCase(),
                  color: CustomColor.pending,
                ),
              ],
            ),
          ),
          Sizes.height.v5,
          TextWidget(
            data.customerLowKycText,
            typographyStyle: TypographyStyle.labelMedium,
            colorShade: ColorShade.mediumForty,
          ),
          Sizes.height.v10,
          PrimaryButton(
            title: Strings.updateCustomer,
            onPressed: () {
              Get.toNamed(Routes.updateCustomerKycScreen);
            },
          ),
        ],
      ),
    );
  }

  _customerCreate(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v5,
          ...controller.inputFields.map((element) {
            return element;
          }),
          _customerCreateButtonWidget(context)
        ],
      ),
    );
  }

  _customerCreateButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.paddingSize * 1.4,
        bottom: Dimensions.paddingSize * 4.8,
      ),
      child: Obx(
        () => PrimaryButton(
          title: Strings.submit,
          isLoading: controller.isCustomerCreateLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.customerCreateProcess().then(
                (v) {
                  Get.close(1);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
