import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/divider.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../controller/money_out_controller.dart';

class MoneyOutPreview extends StatelessWidget {
  MoneyOutPreview({super.key});
  final controller = Get.put(MoneyOutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.preview),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        children: [
          _preview(),
          _buttonWidget(),
        ],
      ),
    );
  }

  _preview() {
    var data = controller.instructionConfirmModel.data.tempData.data.charges;
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        child: Column(
          children: [
            DoubleSideTextWidget(
              keys: Strings.amount,
              value: Strings.charge,
            ),
            DoubleSideTextWidget(
              keys: "${data.requestAmount} ${data.senderCurrencyCode}",
              value:
                  "${data.totalCharge.toStringAsFixed(4)} ${data.senderCurrencyCode}",
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.gateway,
              value: Strings.willGet,
            ),
            DoubleSideTextWidget(
              keys: controller.selectPaymentGateway.value!.name,
              value:
                  "${data.willGet.toStringAsFixed(4)} ${data.gatewayCurrencyCode}",
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.transactionId,
              value: controller.instructionConfirmModel.data.tempData.data
                  .getValues.the1.value,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.totalPayableAmount,
              value:
                  "${data.totalPayable.toStringAsFixed(4)} ${data.senderCurrencyCode}",
              valueStyle: TypographyStyle.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget() {
    return Obx(
      () => Column(
        children: [
          PrimaryButton(
            title: Strings.confirm,
            isLoading: controller.isMoneyOutLoading,
            onPressed: () {
              controller.moneyOutConfirm();
            },
          ),
        ],
      ),
    );
  }
}
