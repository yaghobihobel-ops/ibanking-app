import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/congratulations/controller/congratulations_controller.dart';

class CongratulationsButton extends StatelessWidget {
  CongratulationsButton({super.key});
  final controller = Get.put(CongratulationsController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize * 1.4,
        vertical: Dimensions.verticalSize * 0.8,
      ),
      child: PrimaryButton(
        title: controller.buttonText.value,
        onPressed: () {
          Get.offAllNamed(controller.route.value);
        },
      ),
    );
  }
}
