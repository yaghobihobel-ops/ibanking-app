import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/registration_email_verify/controller/registration_email_verify_controller.dart';

import '../../../../base/utils/basic_import.dart';

class EmailVerifyInputField extends GetView<RegistrationEmailVerifyController> {
  const EmailVerifyInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInputField(
      controller: controller.otpController,
    );
  }
}
