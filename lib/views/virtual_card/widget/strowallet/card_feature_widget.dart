import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../../routes/routes.dart';
import '../../controller/virtual_card_controller.dart';

class CardFeatureWidget extends StatelessWidget {
  CardFeatureWidget({super.key});
  final controller = Get.put(VirtualCardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: Dimensions.verticalSize * 0.7,
        ),
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            _cardWidget(
              title: Strings.details,
              onTap: () {
                Get.toNamed(Routes.strowalletDetailsScreen);
              },
            ),
            if (controller.isMakeDefaultLoading) ...[
              Loader(),
            ] else ...[
              _cardWidget(
                title: controller.selectedCardStatus.value
                    ? Strings.defaultText
                    : Strings.makeDefault,
                onTap: () {
                  if (controller.selectedCardStatus.value) {
                  } else {
                    controller.makeDefault();
                  }
                },
              ),
            ],
            _cardWidget(
              title: Strings.fund,
              onTap: () {
                Get.toNamed(Routes.strowalletAddFundScreen);
              },
            ),
            _cardWidget(
              title: Strings.transactions,
              onTap: () {
                Get.toNamed(Routes.strowalletCardTransactionScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  _cardWidget({required String title, required Null Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: Dimensions.radius * 2.5,
            backgroundColor: CustomColor.primary.withOpacity(0.05),
            child: Icon(
              Icons.info_outline,
              color: CustomColor.primary,
            ),
          ),
          Sizes.height.v5,
          TextWidget(
            title,
            typographyStyle: TypographyStyle.labelSmall,
          ),
        ],
      ),
    );
  }
}
