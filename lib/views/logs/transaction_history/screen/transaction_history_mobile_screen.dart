part of 'transaction_history_screen.dart';

class TransactionHistoryMobileScreen
    extends GetView<TransactionHistoryController> {
  const TransactionHistoryMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.navigation);
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          Strings.transactionHistory,
          leading: BackButtonWidget(
            onTap: () {
              Get.offAllNamed(Routes.navigation);
            },
          ),
        ),
        body: Obx(
          () => controller.isLoading ? Loader() : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var transaction = controller.transactionHistoryModel.data.transactions;
    return SafeArea(
      child: transaction.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize * 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.empty,
                      color: CustomColor.primary,
                    ),
                    Sizes.height.v5,
                    TextWidget(
                      Strings.noDataFound,
                      typographyStyle: TypographyStyle.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : RefreshIndicator(
              color: CustomColor.primary,
              onRefresh: () async {
                controller.getTransactionHistory();
              },
              child: ListView(
                padding: EdgeInsets.only(
                  left: Dimensions.defaultHorizontalSize * 0.8,
                  right: Dimensions.defaultHorizontalSize * 0.8,
                  top: Dimensions.verticalSize * 0.3,
                ),
                children: List.generate(
                  transaction.length,
                  (index) {
                    return Obx(
                      () => InkWell(
                        onTap: () {
                          final selectedTrxId = transaction[index].trxId;
                          controller.expandedTransactionId.value =
                              controller.expandedTransactionId.value ==
                                      selectedTrxId
                                  ? ''
                                  : selectedTrxId;
                        },
                        child: TransactionHistoryWidget(
                          transaction: transaction[index],
                          isExpanded: controller.expandedTransactionId.value ==
                              transaction[index].trxId,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
