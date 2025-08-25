import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/divider.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../controller/transfer_money_controller.dart';

class PaymentChargeScreen extends StatelessWidget {
  PaymentChargeScreen({super.key});
  final controller = Get.put(TransferMoneyController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        children: [
          _previewWidget(),
          Sizes.height.v20,
        ],
      ),
    );
  }

  _previewWidget() {
    return Obx(
      () => !controller.isAvailableChargeInfo.value
          ? Container()
          : controller.isLoading
              ? Text('')
              : Card(
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
                      crossAxisAlignment: crossStart,
                      children: [
                        TextWidget(
                          Strings.transactionPreview,
                          typographyStyle: TypographyStyle.titleMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        DividerWidget(),
                        DoubleSideTextWidget(
                          keys: Strings.minAmount,
                          value: Strings.maxAmount,
                        ),
                        DoubleSideTextWidget(
                          keys:
                              "${controller.minLimit.value} ${controller.baseCurrencyCode.value}",
                          value:
                              "${controller.maxLimit.value} ${controller.baseCurrencyCode.value}",
                          keyStyle: TypographyStyle.bodyMedium,
                          valueStyle: TypographyStyle.bodyMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        DividerWidget(),
                        DoubleSideTextWidget(
                          keys: Strings.amount,
                          value: Strings.charge,
                        ),
                        DoubleSideTextWidget(
                          keys:
                              "${double.parse(controller.amountController.text.isEmpty ? '0.0' : controller.amountController.text).toStringAsFixed(2)} ${controller.baseCurrencyCode.value}",
                          value:
                              "${controller.totalFee.value.toStringAsFixed(2)} ${controller.baseCurrencyCode.value}",
                          keyStyle: TypographyStyle.bodyMedium,
                          valueStyle: TypographyStyle.bodyMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        DividerWidget(),
                        DoubleSideTextWidget(
                          keys: Strings.receiver,
                          value: Strings.totalPayableAmount,
                        ),
                        DoubleSideTextWidget(
                          keys: controller.beneficiaryAccountHolderName.value,
                          value:
                              "${controller.totalAmount.value.toStringAsFixed(2)} ${controller.baseCurrencyCode.value}",
                          image: controller.receiverImage.value,
                          keyStyle: TypographyStyle.bodyMedium,
                          valueStyle: TypographyStyle.bodyMedium,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
