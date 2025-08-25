import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/services/auth_services.dart';

class TwoFaVerificationScreenController extends GetxController {
  final otpController = TextEditingController();
  RxString currentText = "".obs;
  RxBool isFormValid = false.obs;
  void _updateFormValidity() {
    isFormValid.value = otpController.text.length == 6;
  }

  @override
  void onInit() {
    otpController.addListener(_updateFormValidity);
    super.onInit();
  }

  // Routing
  get onOtpSubmit => otpVerifyProcess();

  changeCurrentText(value) {
    currentText.value = value;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isResendLoading = false.obs;
  bool get isResendLoading => _isResendLoading.value;

  otpVerifyProcess() async {
    return AuthServices.twoFaOtpVerifyProcess(
      otp: otpController.text,
      isLoading: _isLoading,
    );
  }
}
