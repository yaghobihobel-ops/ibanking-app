import 'package:dynamic_languages/dynamic_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/dashboard/controller/dashboard_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/input_formater.dart';
import '../../auth/login/widget/brand_logo.dart';
import '../controller/transfer_money_controller.dart';

class AmountWithReceiverInfo extends StatelessWidget {
  AmountWithReceiverInfo({super.key});
  final controller = Get.put(TransferMoneyController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        children: [
          _amountField(),
          _receiverInputField(),
        ],
      ),
    );
  }

  _amountField() {
    return PrimaryInputWidget(
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
              Get.find<DashboardController>()
                  .dashboardInfoModel
                  .data
                  .userWallet
                  .currency,
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
        controller.amount.value = double.parse(v.isEmpty ? '0.0' : v);
      },
    );
  }

  _transferFromWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.4,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            Strings.transferFrom,
            typographyStyle: TypographyStyle.labelSmall,
          ),
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
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
                    decoration: BoxDecoration(
                      color: CustomColor.background,
                      shape: BoxShape.circle,
                    ),
                    child: BrandLogo(
                      scale: 3,
                      edgeInsets: EdgeInsets.zero,
                      height: Dimensions.verticalSize,
                    ),
                  ),
                  Sizes.width.v10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossStart,
                      mainAxisSize: mainMin,
                      children: [
                        TextWidget(
                          Strings.appName +
                              ' ' +
                              DynamicLanguage.key(Strings.wallet),
                          typographyStyle: TypographyStyle.titleMedium,
                          style: CustomStyle.titleMedium.copyWith(),
                        ),
                        TextWidget(
                          Strings.yourMoneyHasBeen,
                          fontSize: Dimensions.labelSmall * 0.9,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _receiverInputField() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: Dimensions.verticalSize * 0.5,
        ),
        child: Column(
          children: [
            PrimaryInputWidget(
              controller: controller.remarkController,
              label: Strings.remarks,
              hintText: Strings.writeHere,
              optionalText: "(${DynamicLanguage.key(Strings.optional)})",
              textInputType: TextInputType.emailAddress,
              showBorderSide: true,
              skipEnterText: true,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
