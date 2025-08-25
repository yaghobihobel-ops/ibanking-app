import 'package:ibanking/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/add_money/controller/add_money_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/divider.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../model /add_money_info_model.dart';

class PaymentGatewayWithPreview extends StatelessWidget {
  PaymentGatewayWithPreview({super.key});
  final controller = Get.put(AddMoneyController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        children: [
          _paymentGateway(),
          _previewWidget(),
        ],
      ),
    );
  }

  _paymentGateway() {
    return Obx(
      () => Column(
        children: [
          CustomDropDown<Currency>(
            inputBoxHeight: Dimensions.inputBoxHeight * 0.95,
            fieldPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSize * 0.7,
              vertical: Dimensions.verticalSize * 0.4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
              color: CustomColor.whiteColor,
            ),
            itemsList: controller.paymentGatewayList,
            label: Strings.selectPaymentGateway,
            subtitle: '',
            selectMethod: controller.selectPaymentGateway.value!.name.obs,
            onChanged: (v) {
              controller.selectPaymentGateway.value = v;
              controller.updateExchangeRateWithLimit();
              controller.getFee(
                rate: v!.rate,
              );
            },
          ),
        ],
      ),
    );
  }

  _previewWidget() {
    return Obx(
      () => !controller.isFormValid.value
          ? Container()
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
                      keys: Strings.amount,
                      value: Strings.charge,
                    ),
                    DoubleSideTextWidget(
                      keys:
                          "${double.parse(controller.amountController.text.isEmpty ? '0.0' : controller.amountController.text).toStringAsFixed(2)} ${controller.baseCurrency.value}",
                      value:
                          "${controller.totalFee.value.toStringAsFixed(2)} ${controller.baseCurrency.value}",
                      keyStyle: TypographyStyle.bodyMedium,
                      valueStyle: TypographyStyle.bodyMedium,
                      fontWeight: FontWeight.w500,
                    ),
                    DividerWidget(),
                    DoubleSideTextWidget(
                      keys: Strings.gateway,
                      value: Strings.totalPayableAmount,
                    ),
                    DoubleSideTextWidget(
                      keys: controller.selectPaymentGateway.value!.name,
                      value:
                          "${controller.totalAmount.value.toStringAsFixed(2)} ${controller.selectPaymentGateway.value!.currencyCode}",
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
