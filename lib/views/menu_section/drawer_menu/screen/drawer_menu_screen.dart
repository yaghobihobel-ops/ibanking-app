import 'package:dynamic_languages/dynamic_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/menu_section/drawer_menu/widget/profile_info.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/drawer_menu_controller.dart';
import '../widget/others_section.dart';

part 'drawer_menu_mobile_screen.dart';
part 'drawer_menu_tablet_screen.dart';

class DrawerMenuScreen extends GetView<DrawerMenuController> {
  const DrawerMenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DrawerMenuMobileScreen(),
      tablet: DrawerMenuTabletScreen(),
    );
  }
}
