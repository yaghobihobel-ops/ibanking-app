import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../../../base/widgets/input_formater.dart';
import '../controller/strowallet_add_fund_controller.dart';

class StrowalletCardFundInputWidget extends StatelessWidget {
  StrowalletCardFundInputWidget({super.key});
  final controller = Get.put(StrowalletAddFundController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v10,
        PrimaryInputWidget(
          controller: controller.amountController,
          label: Strings.amount,
          hintText: '0.00',
          textInputType: TextInputType.emailAddress,
          showBorderSide: true,
          skipEnterText: true,
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
                  controller.baseCurrencyCode.value,
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
            controller.getFee();
          },
        ),
      ],
    );
  }
}
