import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../../base/utils/basic_import.dart';
import '../../drawer_menu/widget/setup_method_model.dart';

class SettingsController extends GetxController {
  final List<SetupMethodModel> menuItems = [
    SetupMethodModel(
      title: Strings.kycVerification,
      description: Strings.pleaseSubmitYour,
      icon: Icons.admin_panel_settings,
      onTap: () {
        Routes.kycInformationScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.twoFaSecurity,
      description: Strings.enable2faTo,
      icon: Icons.lock_rounded,
      onTap: () {
        Routes.twoFaScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.changePassword,
      description: '',
      icon: Icons.key_rounded,
      onTap: () {
        Routes.changePasswordScreen.toNamed;
      },
    ),
    // SetupMethodModel(
    //   title: Strings.themeMode,
    //   description: '',
    //   icon: Icons.vibration_rounded,
    //   onTap: () {},
    // ),
  ];
}
