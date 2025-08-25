part of 'add_beneficiary_screen.dart';

class AddBeneficiaryMobileScreen extends GetView<AddBeneficiaryController> {
  AddBeneficiaryMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(Strings.addBeneficiary),
        body: controller.isLoading || controller.isMethodLoading
            ? Loader()
            : _bodyWidget(context),
        bottomNavigationBar: controller.isSubmitLoading
            ? Container(
                height: Dimensions.heightSize * 3,
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.verticalSize,
                ),
                child: Loader(),
              )
            : (controller.isLoading || controller.isMethodLoading
                ? null
                : _buttonWidget()),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          BeneficiaryInputWidget(),
        ],
      ),
    );
  }

  _buttonWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.horizontalSize,
        right: Dimensions.horizontalSize,
        bottom: Dimensions.verticalSize * 0.5,
      ),
      child: PrimaryButton(
        title: Strings.submit,
        onPressed: () {
          showPinDialog(
            isLoading: controller.isSubmitLoading,
            onPressed: () {
              controller.onSubmit;
            },
          );
        },
      ),
    );
  }
}
