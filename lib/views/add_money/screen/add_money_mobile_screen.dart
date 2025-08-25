part of 'add_money_screen.dart';

class AddMoneyMobileScreen extends GetView<AddMoneyController> {
  AddMoneyMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const CustomAppBar(Strings.addMoney),
        body: controller.isLoading ? Loader() : _bodyWidget(context),
        bottomNavigationBar: controller.isConfirmLoading
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
          AmountWithReceipt(),
          PaymentGatewayWithPreview(),
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
        title: Strings.addMoney,
        disable: !controller.isFormValid.value,
        isLoading: controller.isConfirmLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            checkKycStatus(
              onSuccess: () {
                showPinDialog(
                  isLoading: controller.isConfirmLoading,
                  onPressed: () {
                    if (controller.selectPaymentGateway.value!.alias
                        .contains('manual')) {
                      controller.addMoneyManualInsert();
                    } else {
                      controller.addMoneyAutomaticConfirm();
                    }
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
