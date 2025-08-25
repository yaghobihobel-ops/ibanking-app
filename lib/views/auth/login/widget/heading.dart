import 'package:flutter/material.dart';

import '../../../../base/utils/basic_import.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.verticalSize),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            Strings.logInAndStay,
            fontWeight: FontWeight.bold,
            typographyStyle: TypographyStyle.titleLarge,
          ),
          TextWidget(
            Strings.ourSecureLogIn,
            fontWeight: FontWeight.w400,
            typographyStyle: TypographyStyle.labelLarge,
            colorShade: ColorShade.mediumForty,
            padding: EdgeInsets.only(right: Dimensions.horizontalSize * 1.95),
          ),
        ],
      ),
    );
  }
}
