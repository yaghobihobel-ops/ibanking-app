import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';
import 'package:ibanking/views/auth/login/controller/login_controller.dart';

import '../../../../base/utils/basic_import.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.controller,
  });
  final LogInController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryInputWidget(
          controller: controller.emailAddressController,
          label: Strings.emailAddress,
          hintText: Strings.emailAddress,
          textInputType: TextInputType.emailAddress,
          showBorderSide: true,
        ),
        Sizes.height.betweenInputBox,
        PrimaryInputWidget(
          controller: controller.passwordController,
          label: Strings.password,
          hintText: Strings.password,
          isPasswordField: true,
          textInputType: TextInputType.text,
        ),
        _isRememberMeWidget(context),
        Sizes.height.v30,
      ],
    );
  }

  _isRememberMeWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.66),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Obx(
              //   () => SizedBox(
              //     height: 24.0.h,
              //     width: 24.0.w,
              //     child: Checkbox(
              //       value: controller.isRemember.value,
              //       onChanged: (value) {
              //         controller.isRemember.value = value!;
              //       },
              //       activeColor: CustomColor.primary,
              //       checkColor: controller.isRemember.value
              //           ? Theme.of(context).colorScheme.surface
              //           : null,
              //       shape: RoundedRectangleBorder(
              //         borderRadius:
              //             BorderRadius.circular(Dimensions.radius * 0.4),
              //       ),
              //       side: BorderSide(
              //         color: Get.isDarkMode
              //             ? CustomColor.typographyDark
              //             : CustomColor.typographyShade.mediumForty!,
              //       ),
              //     ),
              //   ),
              // ),
              // Sizes.width.add(Dimensions.widthSize * 0.4),
              // InkWell(
              //   onTap: () {
              //     if (controller.isRemember.value) {
              //       controller.isRemember.value = false;
              //     } else {
              //       controller.isRemember.value = true;
              //     }
              //   },
              //   child: TextWidget(
              //     Strings.rememberMe,
              //     typographyStyle: TypographyStyle.bodyMedium,
              //     colorShade: ColorShade.mediumForty,
              //   ),
              // ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.forgotPasswordScreen);
            },
            child: TextWidget(
              Strings.forgotPassword,
              fontWeight: FontWeight.w400,
              color: CustomColor.primary,
              typographyStyle: TypographyStyle.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
