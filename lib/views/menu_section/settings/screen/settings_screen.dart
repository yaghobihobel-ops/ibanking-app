import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/settings_controller.dart';
import '../widget/settings_method_list.dart';

part 'settings_mobile_screen.dart';
part 'settings_tablet_screen.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SettingsMobileScreen(),
      tablet: SettingsTabletScreen(),
    );
  }
}
