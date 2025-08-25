import 'package:flutter/material.dart';

import '../../../../base/utils/basic_import.dart';

class ReqHeadLineWidget extends StatelessWidget {
  const ReqHeadLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.verticalSize),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v10,
          const TextWidget(
            Strings.registerForAnAccount,
            fontWeight: FontWeight.bold,
            typographyStyle: TypographyStyle.headlineSmall,
          ),
          TextWidget(
            Strings.becomeAPart,
            fontWeight: FontWeight.w500,
            typographyStyle: TypographyStyle.bodySmall,
            colorShade: ColorShade.highEighty,
            padding: EdgeInsets.only(
              right: Dimensions.horizontalSize * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
