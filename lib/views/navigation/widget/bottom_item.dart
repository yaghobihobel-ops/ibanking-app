import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/navigation/controller/navigation_controller.dart';

import '../../../base/utils/basic_import.dart';

class BottomItem extends StatelessWidget {
  BottomItem({super.key, this.icon, required this.label, this.index});
  final IconData? icon;
  final String label;
  final int? index;
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index!;
      },
      child: Obx(
        () => SizedBox(
          width: Dimensions.widthSize * 5.8,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              Icon(
                icon,
                color: controller.selectedIndex.value == index
                    ? CustomColor.primary
                    : CustomColor.disableColor,
              ),
              TextWidget(
                label,
                style: TextStyle(
                  fontSize: Dimensions.labelSmall * 0.9,
                  fontWeight: FontWeight.w500,
                ),
                color: controller.selectedIndex.value == index
                    ? CustomColor.primary
                    : CustomColor.disableColor,
              ),
              Sizes.height.v5,
            ],
          ),
        ),
      ),
    );
  }
}
