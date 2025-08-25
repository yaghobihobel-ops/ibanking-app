import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/dashboard/controller/dashboard_controller.dart';
import 'package:ibanking/views/menu_section/drawer_menu/widget/web_view_screen.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../../routes/routes.dart';
import '../widget/setup_method_model.dart';

class DrawerMenuController extends GetxController {
  get onEditProfile => Routes.profileScreen.toNamed;
  final List<SetupMethodModel> menuItems = [
    SetupMethodModel(
      title: Get.put(DashboardController()).setPinStatus.value == 0
          ? Strings.setupPin
          : Strings.updatePin,
      description: Get.put(DashboardController()).setPinStatus.value == 0
          ? Strings.setupPinDetails
          : Strings.updatePinDetails,
      icon: Icons.password_outlined,
      onTap: () {
        Routes.pinSetupScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.bankStatement,
      description: Strings.statementDetails,
      icon: Icons.article_outlined,
      onTap: () {
        Routes.bankStatementScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.transactionHistory,
      description: Strings.accessYourFull,
      icon: Icons.history_rounded,
      onTap: () {
        Routes.transactionHistoryScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.settings,
      description: Strings.manageKyc2fa,
      icon: Icons.settings_rounded,
      onTap: () {
        Routes.settingsScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.helpCenter,
      description: Strings.getSupportAnd,
      icon: Icons.support_rounded,
      onTap: () {
        Get.to(() => WebViewScreen(title: Strings.helpCenter));
      },
    ),
    SetupMethodModel(
      title: Strings.privacyPolicy,
      description: Strings.reviewOurPrivacy,
      icon: Icons.admin_panel_settings_rounded,
      onTap: () {
        Get.to(() => WebViewScreen(title: Strings.privacyPolicy));
      },
    ),
    SetupMethodModel(
      title: Strings.aboutUs,
      description: Strings.learnAboutOur,
      icon: Icons.lightbulb_rounded,
      onTap: () {
        Get.to(() => WebViewScreen(title: Strings.aboutUs));
      },
    ),
  ];
}
