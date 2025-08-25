import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/transfer_money/controller/transfer_money_controller.dart';

import '../../../base/widgets/divider.dart';
import '../../../base/widgets/double_side_text_widget.dart';

class TransferMoneyPreview extends StatelessWidget {
  TransferMoneyPreview({super.key});
  final controller = Get.put(TransferMoneyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.transactionPreview),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _previewInfo(),
        _buttonWidget(),
      ],
    );
  }

  _previewInfo() {
    var data = controller.transferMoneyPreviewModel.data.tempData.data;
    var beneficiary = data.beneficiary;
    var charges = data.charges;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.5,
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          children: [
            DoubleSideTextWidget(
              keys: Strings.amount,
              value: Strings.charge,
            ),
            DoubleSideTextWidget(
              keys: "${charges.requestAmount} ${charges.senderCurrency}",
              value:
                  "${charges.totalCharge.toStringAsFixed(4)} ${charges.senderCurrency}",
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.willGet,
              value: Strings.transactionType,
            ),
            DoubleSideTextWidget(
              keys: "${charges.receiverAmount} ${charges.receiverCurrency}",
              value: "${beneficiary.method.name}",
              keyStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            if (beneficiary.bank != null) ...[
              DoubleSideTextWidget(
                keys: Strings.beneficiarySubType,
                value: Strings.bankName,
              ),
              DoubleSideTextWidget(
                keys: "${beneficiary.beneficiarySubtype}",
                value: "${beneficiary.bank!.name}",
                keyStyle: TypographyStyle.bodyMedium,
                fontWeight: FontWeight.w500,
              ),
              DividerWidget(),
              DoubleSideTextWidget(
                keys: Strings.branchName,
                value: "${beneficiary.branch!.name}",
              ),
              DividerWidget(),
            ],
            DoubleSideTextWidget(
              keys: Strings.accountNumber,
              value: "${beneficiary.accountNumber}",
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.accountHolderName,
              value: "${beneficiary.accountHolderName}",
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.remarks,
              value: data.remark == null ? "N/A" : data.remark,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.totalPayableAmount,
              value:
                  "${charges.payable.toStringAsFixed(4)} ${charges.senderCurrency}",
              valueStyle: TypographyStyle.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize,
        right: Dimensions.defaultHorizontalSize,
        bottom: Dimensions.verticalSize * 0.6,
        top: Dimensions.verticalSize * 0.2,
      ),
      child: Obx(
        () => PrimaryButton(
          title: Strings.confirm,
          disable: false,
          isLoading: controller.isConfirmLoading,
          onPressed: () {
            controller.transferMoneyConfirm();
          },
        ),
      ),
    );
  }
}
