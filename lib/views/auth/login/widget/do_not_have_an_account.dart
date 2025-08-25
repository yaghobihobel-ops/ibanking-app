import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/api/services/basic_services.dart';
import 'package:ibanking/views/auth/login/controller/login_controller.dart';

import '../../../../base/utils/basic_import.dart';

class DoNotHaveAnAccount extends GetView<LogInController> {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BasicServices.userRegistration.value == 1
          ? Column(
              children: [
                Sizes.height.v20,
                Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    TextWidget(
                      Strings.newTo,
                      colorShade: ColorShade.mediumForty,
                      padding: Dimensions.horizontalSize.edgeHorizontal * 0.08,
                      typographyStyle: TypographyStyle.titleSmall,
                    ),
                    TextWidget(
                      Strings.appName + '? ',
                      colorShade: ColorShade.mediumForty,
                      typographyStyle: TypographyStyle.titleSmall,
                    ),
                    TextWidget(
                      Strings.registerNow,
                      colorShade: ColorShade.mediumForty,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primary,
                      typographyStyle: TypographyStyle.titleSmall,
                      onTap: () {
                        controller.onRegistration;
                      },
                    ),
                  ],
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
