import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../assets/assets.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../../routes/routes.dart';

class KycStatus extends StatelessWidget {
  const KycStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
      ),
      margin: EdgeInsets.only(
        left: Dimensions.defaultHorizontalSize * 0.8,
        right: Dimensions.defaultHorizontalSize * 0.8,
        top: Dimensions.defaultHorizontalSize * 0.6,
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  Assets.icons.kyc,
                  height: Dimensions.heightSize * 6.5,
                ),
                TextWidget(
                  Strings.submitLegalDocs,
                  typographyStyle: TypographyStyle.labelMedium,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.3,
                    vertical: Dimensions.verticalSize * 0.4,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.kycInformationScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalSize * 2.5,
                      vertical: Dimensions.verticalSize * 0.3,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColor.primary,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.9),
                    ),
                    child: TextWidget(
                      Strings.submit,
                      typographyStyle: TypographyStyle.labelMedium,
                      color: CustomColor.whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
