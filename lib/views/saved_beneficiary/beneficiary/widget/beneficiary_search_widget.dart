import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';

import '../../../../base/utils/basic_import.dart';

class BeneficiarySearchWidget extends StatelessWidget {
  BeneficiarySearchWidget({super.key});
  final controller = Get.put(BeneficiaryController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      margin: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize,
        right: Dimensions.defaultHorizontalSize,
        top: Dimensions.verticalSize * 0.5,
        bottom: Dimensions.verticalSize * 0.3,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSize * 0.6,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TextWidget(
                  Strings.search,
                  typographyStyle: TypographyStyle.titleMedium,
                ),
              ],
            ),
            Sizes.height.btnInputTitleAndBox,
            Row(
              children: [
                Expanded(
                  child: PrimaryInputWidget(
                    controller: controller.searchController,
                    hintText: Strings.searchBeneficiary,
                    skipEnterText: true,
                    onChanged: (v) {
                      controller.searchBeneficiaries(v);
                    },
                  ),
                ),
                Sizes.width.v10,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
