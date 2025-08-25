import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/auth/otp_verification/controller/otp_verification_controller.dart';

class OtpSubmitButton extends GetView<OtpVerificationController> {
  const OtpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onOtpSubmit;
          }
        },
      ),
    );
  }
}
