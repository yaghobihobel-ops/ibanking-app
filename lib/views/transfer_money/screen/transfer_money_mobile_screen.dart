part of 'transfer_money_screen.dart';

class TransferMoneyMobileScreen extends GetView<TransferMoneyController> {
  const TransferMoneyMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.moneyTransfer),
      body: _bodyWidget(context),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize,
        right: Dimensions.defaultHorizontalSize,
        bottom: Dimensions.verticalSize * 0.6,
        top: Dimensions.verticalSize * 0.2,
      ),
      child: Obx(
        () => PrimaryButton(
          title: Strings.moneyTransfer,
          disable: !controller.isFormValid.value,
          isLoading: controller.isSubmitLoading,
          onPressed: () {
            if (controller.isFormValid.value) {
              showPinDialog(
                isLoading: controller.isConfirmLoading,
                onPressed: () {
                  controller.moneyTransferSubmitProcess();
                },
              );
            }
          },
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SelectBeneficiary(),
          AmountWithReceiverInfo(),
          PaymentChargeScreen(),
          _buttonWidget(context),
        ],
      ),
    );
  }
}
