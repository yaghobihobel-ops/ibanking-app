import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import 'card_type_widget.dart';
import '../controller/drawer_menu_controller.dart';
import 'log_out_widget.dart';

class OthersSection extends StatelessWidget {
  OthersSection({super.key});
  final controller = Get.put(DrawerMenuController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize * 0.8,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v10,
          TextWidget(
            'GENERAL',
            typographyStyle: TypographyStyle.titleMedium,
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            ),
            child: Column(
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.verticalSize * 0.3,
                      ),
                      child: CardTypeWidget(
                        title: controller.menuItems[index].title,
                        description: controller.menuItems[index].description,
                        icon: controller.menuItems[index].icon,
                        onTap: controller.menuItems[index].onTap,
                        isMenu: true,
                      ),
                    );
                  },
                ),
                Sizes.height.add(Dimensions.verticalSize * 0.4),
              ],
            ),
          ),
          Sizes.height.v10,
          TextWidget(
            'OTHERS',
            typographyStyle: TypographyStyle.titleMedium,
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            ),
            child: Column(
              children: [
                ...List.generate(
                  controller.menuItems.sublist(3).length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.verticalSize * 0.3,
                      ),
                      child: CardTypeWidget(
                        title: controller.menuItems[index + 3].title,
                        description:
                            controller.menuItems[index + 3].description,
                        icon: controller.menuItems[index + 3].icon,
                        onTap: controller.menuItems[index + 3].onTap,
                        isMenu: true,
                      ),
                    );
                  },
                ),
                LogOutWidget(),
                Sizes.height.add(Dimensions.verticalSize * 0.3),
              ],
            ),
          ),
          Sizes.height.add(Dimensions.verticalSize * 0.4),
        ],
      ),
    );
  }
}
