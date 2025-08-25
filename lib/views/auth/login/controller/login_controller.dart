import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/api/services/auth_services.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../../base/utils/basic_import.dart';

class LogInController extends GetxController {
  final emailAddressController = TextEditingController();
  final forgotEmailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isFormValid = false.obs;
  RxBool isRemember = false.obs;
  get onForgotPassword => Routes.otpVerificationScreen.toNamed;
  get onRegistration => Routes.registrationScreen.toNamed;
  get onLogInProcess => logInProcess();

  @override
  void onInit() {

    emailAddressController.addListener(_updateFormValidity);
    passwordController.addListener(_updateFormValidity);

    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  logInProcess() async {
    return AuthServices.logInService(
      credentials: emailAddressController.text,
      password: passwordController.text,
      isLoading: _isLoading,
    ).then((value) {
      emailAddressController.clear();
      passwordController.clear();
    });
  }

  logOutProcess() async {
    return AuthServices.logOutService(
      isLoading: _isLoading,
    );
  }

  deleteAccountProcess() async {
    return AuthServices.deleteAccountServices(
      isLoading: _isLoading,
    );
  }

  void _updateFormValidity() {
    isFormValid.value = emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  @override
  void onClose() {
    emailAddressController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
