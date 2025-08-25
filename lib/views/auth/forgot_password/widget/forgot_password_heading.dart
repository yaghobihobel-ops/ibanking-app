import 'package:flutter/material.dart';

import '../../../../base/utils/basic_import.dart';

class ForgotPasswordHeading extends StatelessWidget {
  const ForgotPasswordHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v10,
          TextWidget(
            Strings.resetYourForgotten,
            fontWeight: FontWeight.bold,
            typographyStyle: TypographyStyle.titleLarge,
          ),
          TextWidget(
            Strings.takeControl,
            fontWeight: FontWeight.w400,
            typographyStyle: TypographyStyle.bodySmall,
            colorShade: ColorShade.mediumForty,
            padding: EdgeInsets.only(
              right: Dimensions.horizontalSize * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
