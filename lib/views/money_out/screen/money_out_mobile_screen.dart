part of 'money_out_screen.dart';

class MoneyOutMobileScreen extends GetView<MoneyOutController> {
  const MoneyOutMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(Strings.moneyOut),
        body: controller.isLoading ? Loader() : _bodyWidget(context),
        bottomNavigationBar:
            controller.isSubmitLoading || controller.isInstructionsLoading
                ? Container(
                    height: Dimensions.heightSize * 3,
                    margin: EdgeInsets.symmetric(
                      vertical: Dimensions.verticalSize,
                    ),
                    child: Loader(),
                  )
                : (controller.isLoading ? null : _buttonWidget(context)),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          MoneyOutAmountWidget(),
          MoneyOutPaymentGateway(),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize,
        right: Dimensions.defaultHorizontalSize,
        bottom: Dimensions.verticalSize * 0.4,
        top: Dimensions.verticalSize * 0.2,
      ),
      child: PrimaryButton(
        title: Strings.moneyOut,
        disable: !controller.isFormValid.value,
        isLoading:
            controller.isSubmitLoading || controller.isInstructionsLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            checkKycStatus(
              onSuccess: () {
                showPinDialog(
                  isLoading: controller.isSubmitLoading ||
                      controller.isInstructionsLoading,
                  onPressed: () {
                    controller.onMoneyOut;
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
