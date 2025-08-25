import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibanking/assets/assets.dart';

import '../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import 'bottom_item.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColor.whiteColor,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      height: Dimensions.heightSize * 6,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 5,
      shadowColor: CustomColor.blackColor.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 0.5, top: Dimensions.paddingSize * 0.2),
              child: BottomItem(
                icon: Icons.home_rounded,
                label: Strings.home,
                index: 0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.2),
              child: BottomItem(
                icon: Icons.people,
                label: Strings.beneficiary,
                index: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.35),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.transferMoneyScreen);
                    },
                    child: CircleAvatar(
                      radius: Dimensions.radius * 2,
                      backgroundColor: CustomColor.primary,
                      child: SvgPicture.asset(
                        Assets.icons.send,
                        color: Colors.white,
                        height: 18,
                      ),
                    ),
                  ),
                  Sizes.height.v5,
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.2),
              child: BottomItem(
                icon: Icons.credit_card_rounded,
                label: Strings.virtualCard,
                index: 2,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimensions.paddingSize * 0.2,
                left: Dimensions.paddingSize * 0.5,
              ),
              child: BottomItem(
                icon: Icons.history,
                label: Strings.history,
                index: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
