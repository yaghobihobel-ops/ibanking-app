import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';

import '../../profile/controller/profile_controller.dart';
import '../controller/drawer_menu_controller.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});
  final controller = Get.put(DrawerMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomColor.primary,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: Dimensions.radius * 4.5,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    Get.find<ProfileController>().userImage.value != ''
                        ? NetworkImage(
                            Get.find<ProfileController>().userImage.value,
                          )
                        : null,
              ),
            ),
            Sizes.height.v5,
            Column(
              crossAxisAlignment: crossCenter,
              children: [
                TextWidget(
                  Get.find<ProfileController>().userName.value,
                  typographyStyle: TypographyStyle.titleLarge,
                ),
                TextWidget(
                  Get.find<ProfileController>().userEmail.value,
                  typographyStyle: TypographyStyle.labelMedium,
                ),
                Sizes.height.v5,
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                            text: Get.find<ProfileController>()
                                .accountNumber
                                .value))
                        .then((_) {
                      CustomSnackBar.success(
                        title: Strings.success,
                        message: Strings.copiedToClipboard,
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: mainCenter,
                    children: [
                      TextWidget(
                        Get.find<ProfileController>().accountNumber.value,
                        typographyStyle: TypographyStyle.labelMedium,
                      ),
                      Sizes.width.v5,
                      Icon(
                        Icons.copy,
                        size: Dimensions.iconSizeDefault * 0.7,
                        color: CustomColor.primary,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.onEditProfile;
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Dimensions.verticalSize * 0.33,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalSize * 0.4,
                      vertical: Dimensions.verticalSize * 0.2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 50),
                      color: CustomColor.primary,
                    ),
                    child: Row(
                      mainAxisSize: mainMin,
                      children: [
                        TextWidget(
                          Strings.editProfile,
                          typographyStyle: TypographyStyle.labelMedium,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.whiteColor,
                        ),
                        Sizes.width.v5,
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: Dimensions.iconSizeDefault * 0.7,
                          color: CustomColor.whiteColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Sizes.height.v10,
          ],
        ),
      ),
    );
  }
}
