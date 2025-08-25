import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';

import '../controller/reset_password_controller.dart';

class ResetPasswordInputWidget extends GetView<ResetPasswordController> {
  const ResetPasswordInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.verticalSize,
        ),
        child: Column(
          children: [
            PrimaryInputWidget(
              controller: controller.newPasswordController,
              label: Strings.newPassword,
              hintText: Strings.newPassword,
              isPasswordField: true,
            ),
            Sizes.height.betweenInputBox,
            PrimaryInputWidget(
              controller: controller.confirmPasswordController,
              label: Strings.confirmPassword,
              hintText: Strings.confirmPassword,
              isPasswordField: true,
            ),
          ],
        ),
      ),
    );
  }
}
