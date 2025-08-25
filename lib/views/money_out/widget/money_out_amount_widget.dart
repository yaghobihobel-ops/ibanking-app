import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/money_out/controller/money_out_controller.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/input_formater.dart';

class MoneyOutAmountWidget extends StatelessWidget {
  MoneyOutAmountWidget({super.key});
  final controller = Get.put(MoneyOutController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Column(
          children: [
            _amountField(),
            _receiptWidget(context),
          ],
        ),
      ),
    );
  }

  _amountField() {
    return PrimaryInputWidget(
      controller: controller.amountController,
      label: Strings.amount,
      hintText: '0.00',
      skipEnterText: true,
      textInputType: TextInputType.number,
      showBorderSide: true,
      suffixIconPadding: EdgeInsets.zero,
      suffixIcon: Container(
        width: Dimensions.widthSize * 8.8,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSize * 0.5,
          horizontal: Dimensions.paddingSize * 0.3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius * 1.2),
            bottomRight: Radius.circular(Dimensions.radius * 1.2),
          ),
          color: CustomColor.primary,
        ),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            TextWidget(
              controller.baseCurrency.value,
              typographyStyle: TypographyStyle.titleMedium,
              color: Colors.white,
            ),
          ],
        ),
      ),
      inputFormatters: [
        DecimalTextInputFormatter(decimalRange: 2),
      ],
      onChanged: (v) {
        controller.getFee(
          rate: controller.selectPaymentGateway.value!.rate,
        );
      },
    );
  }

  _receiptWidget(BuildContext context) {
    return !controller.isFormValid.value
        ? Container()
        : Padding(
            padding: EdgeInsets.only(
              top: Dimensions.verticalSize * 0.4,
            ),
            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalSize * 0.55,
                      vertical: Dimensions.verticalSize * 0.5,
                    ),
                    child: Column(
                      children: [
                        _limitWidget(
                          label: Strings.exchangeRate,
                          text: controller.exchangeRateText.value,
                        ),
                        _limitWidget(
                          label: Strings.limit,
                          text: controller.limitText.value,
                        ),
                        _limitWidget(
                          showDotLine: false,
                          label: Strings.charge,
                          text: controller.chargeText.value,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _limitWidget({
    bool showDotLine = true,
    required String label,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.verticalSize * 0.05,
          ),
          child: Column(
            mainAxisAlignment: mainStart,
            children: [
              CircleAvatar(
                backgroundColor: CustomColor.disableColor.withOpacity(0.2),
                radius: Dimensions.radius * 0.7,
                child: Icon(
                  Icons.remove_rounded,
                  size: Dimensions.iconSizeSmall,
                  color: CustomColor.typography.withOpacity(0.7),
                ),
              ),
              if (showDotLine)
                Container(
                  height: Dimensions.heightSize * 1.3,
                  width: 1.8,
                  decoration: BoxDecoration(
                    border: RDottedLineBorder(
                      dottedLength: 4,
                      dottedSpace: 1.2,
                      left: BorderSide(
                        color: CustomColor.disableColor,
                        width: 1.8,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        Sizes.width.v10,
        Row(
          crossAxisAlignment: crossStart,
          mainAxisAlignment: mainStart,
          children: [
            TextWidget(
              label,
              typographyStyle: TypographyStyle.labelMedium,
              colorShade: ColorShade.lowThirty,
              fontWeight: FontWeight.w400,
            ),
            Sizes.width.v5,
            TextWidget(
              text,
              typographyStyle: TypographyStyle.labelMedium,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
