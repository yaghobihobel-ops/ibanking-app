import 'package:dynamic_languages/dynamic_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../../assets/assets.dart';
import '../../../../base/utils/basic_import.dart';

class BeneficiaryAddWidget extends StatelessWidget {
  BeneficiaryAddWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.icons.people.path),
            TextWidget(
              Strings.noBeneficiary,
              textAlign: TextAlign.center,
              fontSize: Dimensions.labelSmall * 0.9,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.addBeneficiaryScreen);
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.verticalSize * 0.33,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalSize * 0.4,
                  vertical: Dimensions.verticalSize * 0.15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 50),
                  border: Border.all(
                    color: CustomColor.primary,
                  ),
                ),
                child: TextWidget(
                  '+' + ' ' + DynamicLanguage.key(Strings.addBeneficiary),
                  typographyStyle: TypographyStyle.labelMedium,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
