import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/kyc_information_controller.dart';

class KycHeadingWidget extends GetView<KycInformationController> {
  const KycHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int status = controller.kycInfoModel.data.kycStatus;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v10,
          Row(
            children: [
              TextWidget(
                Strings.kycInformation,
                fontWeight: FontWeight.bold,
                typographyStyle: TypographyStyle.titleLarge,
              ),
              Sizes.width.v10,
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
                decoration: BoxDecoration(
                  color: getColorByKycStatus(status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                ),
                child: status == 0
                    ? Row(
                        children: [
                          Icon(
                            Icons.warning_rounded,
                            color: getColorByKycStatus(status),
                          ),
                          TextWidget(
                            Strings.unverified,
                            fontWeight: FontWeight.w400,
                            typographyStyle: TypographyStyle.labelLarge,
                            color: getColorByKycStatus(status),
                          ),
                        ],
                      )
                    : status == 2
                        ? Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: getColorByKycStatus(status),
                              ),
                              TextWidget(
                                Strings.pending,
                                fontWeight: FontWeight.w400,
                                typographyStyle: TypographyStyle.labelLarge,
                                color: getColorByKycStatus(status),
                              ),
                            ],
                          )
                        : status == 1
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: getColorByKycStatus(status),
                                  ),
                                  TextWidget(
                                    Strings.verified,
                                    fontWeight: FontWeight.w400,
                                    typographyStyle: TypographyStyle.labelLarge,
                                    color: getColorByKycStatus(status),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.block,
                                    color: getColorByKycStatus(status),
                                  ),
                                  TextWidget(
                                    Strings.rejected,
                                    fontWeight: FontWeight.w400,
                                    typographyStyle: TypographyStyle.labelLarge,
                                    color: getColorByKycStatus(status),
                                  ),
                                ],
                              ),
              ),
            ],
          ),
          TextWidget(
            Strings.pleaseSubmitYourKyc,
            fontWeight: FontWeight.w400,
            typographyStyle: TypographyStyle.labelLarge,
            colorShade: ColorShade.mediumForty,
            padding: EdgeInsets.only(right: Dimensions.horizontalSize * 1.95),
          ),
          Sizes.height.v10,
        ],
      ),
    );
  }
}

Color getColorByKycStatus(int kycStatus) {
  Color color;
  switch (kycStatus) {
    case 0:
      color = CustomColor.rejected;
    case 1:
      color = CustomColor.selected;
    case 2:
      color = CustomColor.pending;
    case 3:
      color = CustomColor.rejected;
    default:
      color = CustomColor.background;
  }
  return color;
}
