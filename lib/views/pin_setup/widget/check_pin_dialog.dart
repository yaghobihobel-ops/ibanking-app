import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../controller/pin_setup_controller.dart';

void showPinDialog({required VoidCallback onPressed, required bool isLoading}) {
  final controller = Get.put(PinSetupController());

  if (controller.controller.setPinStatus.value == 0) {
    Get.toNamed(Routes.pinSetupScreen);
  } else {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          controller.checkPinController.clear();
          controller.pinStatus.value = '';
          controller.isPinMatched.value = false;
          return true;
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
            child: Column(
              mainAxisSize: mainMin,
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TextWidget(
                      Strings.checkYourPin,
                      typographyStyle: TypographyStyle.titleMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.close(1);
                        controller.checkPinController.clear();
                        controller.pinStatus.value = '';
                        controller.isPinMatched.value = false;
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                Sizes.height.add(Dimensions.verticalSize * 0.2),
                PrimaryInputWidget(
                  controller: controller.checkPinController,
                  hintText: Strings.pin,
                  label: Strings.verifyYourPin,
                  onChanged: (value) {},
                ),
                // Sizes.height.add(Dimensions.verticalSize * 0.4),
                // controller.pinStatus.value != ''
                //     ? Obx(
                //         () => TextWidget(
                //           controller.pinStatus.value,
                //           color: controller.isPinMatched.value
                //               ? Colors.green
                //               : Colors.red,
                //         ),
                //       )
                //     : const SizedBox.shrink(),
                Sizes.height.add(Dimensions.verticalSize * 0.6),
                Obx(
                  () => PrimaryButton(
                    title: Strings.confirm,
                    isLoading: controller.isSubmitLoading || isLoading,
                    onPressed: () {
                      controller
                          .pinCheck(controller.checkPinController.text)
                          .then(
                        (v) {
                          if (controller.isPinMatched.value &&
                              controller.pinStatus.value != '') {
                            Get.close(1);
                            onPressed();
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
