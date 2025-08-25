import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/api/services/auth_services.dart';
import 'package:ibanking/base/api/services/basic_services.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/routes/routes.dart';

class RegistrationController extends GetxController {
  final emailAddressController = TextEditingController();
  final companyNameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final referralIdController = TextEditingController();
  RxBool agree = false.obs;
  RxString countrySelectMethod = ''.obs;
  RxString selectAccountType = Strings.personalAccount.obs;

  // Account Type
  final List<String> accountType = [
    Strings.personalAccount,
    Strings.businessAccount
  ];

  // Routing
  get onRegistration => registrationProcess();
  get onLogIn => Routes.loginScreen.toNamed;
  get onPrivacyPolicy => '';
  RxBool isFormValid = false.obs;

  @override
  void onInit() {
    emailAddressController.addListener(_updateFormValidity);
    passwordController.addListener(_updateFormValidity);
    firstNameController.addListener(_updateFormValidity);
    lastNameController.addListener(_updateFormValidity);
    BasicServices.getBasicSettingsInfo();
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  registrationProcess() async {
    return AuthServices.registrationProcess(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailAddressController.text,
      password: passwordController.text,
      isLoading: _isLoading,
      accountType: selectAccountType.value,
      country: countrySelectMethod.value,
      companyName: companyNameController.text,
    );
  }
}
