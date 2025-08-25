import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../../../base/widgets/input_formater.dart';
import '../controller/strowallet_card_create_controller.dart';

class StrowalletCardCreateInputWidget extends StatelessWidget {
  StrowalletCardCreateInputWidget({super.key});
  final controller = Get.put(StrowalletCardCreateController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v10,
        PrimaryInputWidget(
          controller: controller.cardHolderNameController,
          label: Strings.cardHolderName,
          hintText: Strings.cardHolderName,
          textInputType: TextInputType.emailAddress,
          showBorderSide: true,
          skipEnterText: true,
          suffixIconPadding: EdgeInsets.zero,
        ),
        Sizes.height.betweenInputBox,
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
              color: CustomColor.disableColor.withOpacity(0.18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: CustomColor.primary,
                  radius: Dimensions.radius * 1.5,
                  backgroundImage:
                      NetworkImage(controller.baseCurrencyImage.value),
                ),
                Sizes.width.v5,
                TextWidget(
                  controller.baseCurrencyCode.value,
                  typographyStyle: TypographyStyle.titleMedium,
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
