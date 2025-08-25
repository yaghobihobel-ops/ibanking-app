import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../assets/assets.dart';
import '../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../auth/kyc_information/controller/kyc_information_controller.dart';

class KycStatusWidget extends GetView<KycInformationController> {
  const KycStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => controller.kycStatus.value == 0 || controller.kycStatus.value == 3
            ? Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
                ),
                margin: EdgeInsets.only(
                  left: Dimensions.defaultHorizontalSize * 0.8,
                  right: Dimensions.defaultHorizontalSize * 0.8,
                  top: Dimensions.defaultHorizontalSize * 0.6,
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  child: FittedBox(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.demography),
                        TextWidget(
                          Strings.submitLegalDocs,
                          typographyStyle: TypographyStyle.labelSmall,
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.horizontalSize * 0.3,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.kycInformationScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.horizontalSize * 0.4,
                              vertical: Dimensions.verticalSize * 0.3,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColor.primary,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius * 0.9),
                            ),
                            child: TextWidget(
                              Strings.submit,
                              typographyStyle: TypographyStyle.labelSmall,
                              color: CustomColor.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox());
  }
}
