import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/otp_verification/controller/otp_verification_controller.dart';

import '../../../../base/utils/basic_import.dart';

class ResetOtpInputField extends GetView<OtpVerificationController> {
  const ResetOtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInputField(
      controller: controller.otpController,
    );
  }
}
