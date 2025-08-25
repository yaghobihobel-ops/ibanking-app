import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/auth/reset_password/controller/reset_password_controller.dart';

class ResetPasswordSubmitButton extends GetView<ResetPasswordController> {
  const ResetPasswordSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onResetPasswordSubmit;
          }
        },
      ),
    );
  }
}
