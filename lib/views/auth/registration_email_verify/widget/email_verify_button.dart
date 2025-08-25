import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/auth/registration_email_verify/controller/registration_email_verify_controller.dart';

class EmailVerifyButton extends GetView<RegistrationEmailVerifyController> {
  const EmailVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onEmailVerify;
          }
        },
      ),
    );
  }
}
