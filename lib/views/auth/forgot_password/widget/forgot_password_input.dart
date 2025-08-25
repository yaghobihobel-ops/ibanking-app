import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordInput extends StatelessWidget {
  const ForgotPasswordInput({
    super.key,
    required this.controller,
  });
  final ForgotPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSize,
            ),
            child: PrimaryInputWidget(
              controller: controller.emailAddressController,
              label: Strings.emailAddress,
              hintText: Strings.emailAddress,
              textInputType: TextInputType.emailAddress,
              showBorderSide: true,
            ),
          ),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.sendOtp,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onForgotPassword;
          }
        },
      ),
    );
  }
}
