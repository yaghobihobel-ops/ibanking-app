import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/dashboard/controller/dashboard_controller.dart';

import '../../../routes/routes.dart';

class FeatureSection extends StatelessWidget {
  FeatureSection({super.key});
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalSize * 0.6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              Strings.currentBalance,
              colorShade: ColorShade.mediumForty,
            ),
            Row(
              children: [
                TextWidget(
                  controller.availableBalance.value,
                  fontSize: Dimensions.headlineLarge * 0.9,
                ),
              ],
            ),
            Sizes.height.v5,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.addMoneyScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColor.primary,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius * 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSize * 0.3,
                        vertical: Dimensions.verticalSize * 0.3,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: Dimensions.iconSizeDefault,
                          ),
                          TextWidget(
                            Strings.addMoney,
                            fontSize: Dimensions.titleMedium * 0.8,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalSize * 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Sizes.width.v5,
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.moneyOutScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColor.primary),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius * 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSize * 0.3,
                        vertical: Dimensions.verticalSize * 0.3,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.north_east_rounded,
                            color: CustomColor.primary,
                            size: Dimensions.iconSizeDefault,
                          ),
                          TextWidget(
                            Strings.moneyOut,
                            fontSize: Dimensions.titleMedium * 0.8,
                            color: CustomColor.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalSize * 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Sizes.width.v30,
                SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
