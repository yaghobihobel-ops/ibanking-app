import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../auth/login/widget/brand_logo.dart';
import '../controller/dashboard_controller.dart';

class TopBarWidget extends GetView<DashboardController> {
  TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainMin,
      children: [
        _actionWidget(context),
      ],
    );
  }

  _actionWidget(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: Dimensions.verticalSize * 0.5,
          bottom: Dimensions.verticalSize * 0.7,
          left: Dimensions.horizontalSize * 0.8,
          right: Dimensions.horizontalSize * 0.3,
        ),
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            BrandLogo(
              edgeInsets: EdgeInsets.zero,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.onNotificationHistory;
                  },
                  child: Icon(
                    Icons.notifications_rounded,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.onProfile;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultHorizontalSize * 0.7,
                    ),
                    child: controller.controller.isAvailableUserImage.value
                        ? Container(
                            padding:
                                EdgeInsets.all(Dimensions.paddingSize * 0.12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: RDottedLineBorder.all(
                                color: CustomColor.primary,
                              ),
                            ),
                            child: Obx(
                              () => CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: Dimensions.radius,
                                backgroundImage: NetworkImage(
                                  controller.controller.userImage.value,
                                ),
                              ),
                            ),
                          )
                        : Icon(
                            Icons.account_circle_outlined,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
