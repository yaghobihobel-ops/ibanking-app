part of 'strowallet_card_transaction_screen.dart';

class StrowalletCardTransactionMobileScreen
    extends GetView<StrowalletCardTransactionController> {
  const StrowalletCardTransactionMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.virtualCardTransaction),
      body: Obx(
        () => controller.isLoading ? const Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data =
        controller.strowalletCardTransactionModel.data.first.cardTransactions;

    return data.isNotEmpty
        ? RefreshIndicator(
            color: CustomColor.primary,
            onRefresh: () async {
              controller.getCardTransaction();
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CardTransactionWidget(
                  data: data[index],
                );
              },
            ),
          )
        : Center(
            child: TextWidget(
              Strings.noRecordFound,
            ),
          );
  }
}
