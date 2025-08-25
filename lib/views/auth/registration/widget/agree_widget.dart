import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/registration/controller/registration_controller.dart';

import '../../../../base/api/services/basic_services.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../menu_section/drawer_menu/widget/web_view_screen.dart';

class AgreeWidget extends GetView<RegistrationController> {
  const AgreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BasicServices.agreePolicy.value == 1
        ? Container(
            margin: EdgeInsets.only(top: Dimensions.heightSize * 0.66),
            child: FittedBox(
              child: Row(
                children: [
                  Obx(
                    () => SizedBox(
                      height: 24.0.h,
                      width: 24.0.w,
                      child: Checkbox(
                        value: controller.agree.value,
                        onChanged: (value) {
                          controller.agree.value = value!;
                        },
                        activeColor: CustomColor.primary,
                        checkColor: controller.agree.value
                            ? Theme.of(context).colorScheme.surface
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 0.2),
                        ),
                        side: BorderSide(
                          color: Get.isDarkMode
                              ? CustomColor.typographyDark.withOpacity(0.50)
                              : CustomColor.typography.withOpacity(0.50),
                        ),
                      ),
                    ),
                  ),
                  Sizes.width.v5,
                  TextWidget(
                    Strings.agree,
                    typographyStyle: TypographyStyle.labelMedium,
                  ),
                  Sizes.width.v5,
                  TextWidget(
                    Strings.termsOfUse,
                    typographyStyle: TypographyStyle.labelMedium,
                    color: CustomColor.primary,
                    onTap: () {
                      Get.to(() => WebViewScreen(title: Strings.privacyPolicy));
                    },
                  ),
                  Sizes.width.add(Dimensions.widthSize * 0.4),
                ],
              ),
            ),
          )
        : const SizedBox.shrink());
  }
}
