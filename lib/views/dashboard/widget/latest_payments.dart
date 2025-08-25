import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../assets/assets.dart';
import '../../../base/utils/basic_import.dart';
import '../../logs/transaction_history/controller/transaction_history_controller.dart';
import '../../logs/transaction_history/widget/transaction_history_widget.dart';

class LatestPayments extends GetView<TransactionHistoryController> {
  const LatestPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize * 0.8,
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisSize: mainMin,
            children: [
              TextWidget(
                Strings.transactions,
                typographyStyle: TypographyStyle.titleMedium,
                fontWeight: FontWeight.w600,
              ),
              Sizes.height.btnInputTitleAndBox,
              controller.isLoading
                  ? Text('')
                  : Flexible(
                      child: controller
                              .transactionHistoryModel.data.transactions.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.defaultHorizontalSize * 3,
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
                                      typographyStyle:
                                          TypographyStyle.labelSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(
                                controller.transactionHistoryModel.data
                                            .transactions.length >
                                        5
                                    ? 5
                                    : controller.transactionHistoryModel.data
                                        .transactions.length,
                                (index) {
                                  var transaction = controller
                                      .transactionHistoryModel
                                      .data
                                      .transactions;
                                  return InkWell(
                                    onTap: () {
                                      final selectedTrxId =
                                          transaction[index].trxId;
                                      controller.expandedTransactionId.value =
                                          controller.expandedTransactionId
                                                      .value ==
                                                  selectedTrxId
                                              ? ''
                                              : selectedTrxId;
                                    },
                                    child: TransactionHistoryWidget(
                                      transaction: transaction[index],
                                      isExpanded: controller
                                              .expandedTransactionId.value ==
                                          transaction[index].trxId,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
              Sizes.height.v10,
            ],
          ),
        ));
  }
}
