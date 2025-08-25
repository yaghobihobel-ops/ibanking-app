import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/transfer_money/controller/transfer_money_controller.dart';

import '../../../base/utils/basic_import.dart';
import 'beneficiary_list_sheet.dart';

class SelectBeneficiary extends StatelessWidget {
  SelectBeneficiary({super.key});
  final controller = Get.put(TransferMoneyController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Sizes.height.btnInputTitleAndBox,
            TextWidget(
              Strings.beneficiary,
              style: CustomStyle.labelSmall.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Sizes.height.btnInputTitleAndBox,
            InkWell(
              onTap: () {
                showBeneficiaryList(context);
              },
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.7),
                  child: Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      TextWidget(
                        controller.beneficiaryAccountHolderName.value,
                        typographyStyle: TypographyStyle.titleMedium,
                      ),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ),
              ),
            ),
            Sizes.height.betweenInputBox,
          ],
        ),
      ),
    );
  }
}
