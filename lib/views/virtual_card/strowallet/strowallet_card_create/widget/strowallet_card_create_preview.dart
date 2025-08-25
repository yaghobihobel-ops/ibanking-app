import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../../../base/widgets/divider.dart';
import '../../../../../base/widgets/double_side_text_widget.dart';
import '../controller/strowallet_card_create_controller.dart';

class StrowalletCardCreatePreview extends StatelessWidget {
  StrowalletCardCreatePreview({super.key});
  final controller = Get.put(StrowalletCardCreateController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _previewWidget(),
        _buttonWidget(context),
      ],
    );
  }

  _previewWidget() {
    return Obx(
      () => Card(
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
                keys: Strings.totalPayableAmount,
                value:
                    "${controller.totalAmount.value.toStringAsFixed(2)} ${controller.baseCurrencyCode.value}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.verticalSize,
        ),
        child: PrimaryButton(
          title: Strings.buyCard,
          disable: !controller.isFormValid.value,
          isLoading: controller.isBuyLoading,
          onPressed: () {
            if (controller.isFormValid.value) {
              controller.buyCard();
            }
          },
        ),
      ),
    );
  }
}
