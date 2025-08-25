import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/auth/registration/controller/registration_controller.dart';

import '../../../../base/api/services/basic_services.dart';

class RegButton extends GetView<RegistrationController> {
  const RegButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: Dimensions.verticalSize.edgeVertical * 0.7,
        child: PrimaryButton(
          disable: !controller.isFormValid.value,
          title: Strings.registerNow,
          isLoading: controller.isLoading,
          onPressed: () {
            if (controller.isFormValid.value) {
              if (BasicServices.agreePolicy.value == 1) {
                if (controller.agree.value) {
                  controller.onRegistration;
                } else {
                  CustomSnackBar.error(Strings.agreeToTerms);
                }
              } else {
                controller.onRegistration;
              }
            }
          },
        ),
      ),
    );
  }
}
