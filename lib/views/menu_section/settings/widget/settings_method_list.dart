import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../drawer_menu/widget/card_type_widget.dart';
import '../controller/settings_controller.dart';
import 'delete_account_widget.dart';
import 'language_change_widget.dart';

class SettingsMethodList extends StatelessWidget {
  SettingsMethodList({super.key});
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageChangeWidget(),
        Column(
          children: List.generate(
            controller.menuItems.length,
            (index) {
              return CardTypeWidget(
                title: controller.menuItems[index].title,
                description: controller.menuItems[index].description,
                icon: controller.menuItems[index].icon,
                onTap: controller.menuItems[index].onTap,
              );
            },
          ),
        ),
        DeleteAccountWidget(),
      ],
    );
  }
}
