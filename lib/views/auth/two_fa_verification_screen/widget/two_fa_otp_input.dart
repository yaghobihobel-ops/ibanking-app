import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/two_fa_verification_screen_controller.dart';

class TwoFaOtpInput extends GetView<TwoFaVerificationScreenController> {
  const TwoFaOtpInput({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInputField(
      controller: controller.otpController,
    );
  }
}
