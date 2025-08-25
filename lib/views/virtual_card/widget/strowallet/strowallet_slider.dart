import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../assets/assets.dart';
import '../../../../base/utils/basic_import.dart';
import '../../controller/virtual_card_controller.dart';
import 'card_feature_widget.dart';
import 'visa_card_widget.dart';

class StrowalletSlider extends StatelessWidget {
  StrowalletSlider({
    super.key,
  });
  final controller = Get.put(VirtualCardController());

  @override
  Widget build(BuildContext context) {
    var myCards = controller.strowalletCardInfoModel.data.data.myCards;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: myCards.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(
                Dimensions.paddingSize * 0.5,
              ),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  CarouselSlider(
                    items: myCards.map((card) {
                      return Builder(
                        builder: (BuildContext context) {
                          return VisaCardWidget(
                            cardNumber: card.cardNumber,
                            expiryDate: card.expiry,
                            balance: card.balance.toString(),
                            validAt: card.expiry,
                            cvv: card.cvv,
                            cardHolderName: card.name,
                            logo: card.siteLogo,
                            cardBankDetails: card.cardBackDetails,
                            cardBgNetwork: controller.strowalletCardInfoModel
                                .data.data.cardBasicInfo.cardBg,
                          );
                        },
                      );
                    }).toList(),
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        controller.current.value = index;
                        controller.strowalletCardId.value =
                            myCards[index].cardId;
                        controller.selectedCardStatus.value =
                            myCards[index].isDefault;
                      },
                      height: MediaQuery.of(context).size.height * 0.28,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      aspectRatio: 17 / 9,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.verticalSize * 0.3,
                    ),
                    child: Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        TextWidget(Strings.myCard),
                        Sizes.width.v5,
                        TextWidget(
                          '${myCards.length}/${controller.strowalletCardInfoModel.data.data.cardBasicInfo.cardCreateLimit}',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller
                        .strowalletCardInfoModel.data.data.myCards
                        .asMap()
                        .entries
                        .map((entry) {
                      return controller.current.value == entry.key
                          ? Container(
                              width: Dimensions.widthSize * 1,
                              height: Dimensions.heightSize * 0.6,
                              margin: EdgeInsets.only(
                                bottom: Dimensions.verticalSize * 0.2,
                                left: Dimensions.horizontalSize * 0.2,
                                right: Dimensions.horizontalSize * 0.2,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColor.blackColor,
                              ))
                          : Container(
                              width: Dimensions.widthSize * 0.7,
                              height: Dimensions.heightSize * 0.5,
                              margin: EdgeInsets.only(
                                bottom: Dimensions.verticalSize * 0.2,
                                left: Dimensions.horizontalSize * 0.2,
                                right: Dimensions.horizontalSize * 0.2,
                              ),
                              decoration: BoxDecoration(
                                color: CustomColor.blackColor.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                            );
                    }).toList(),
                  ),
                  CardFeatureWidget(),
                ],
              ),
            )
          : Column(
              children: [
                VisaCardWidget(
                  cardNumber: 'xxxx xxxx xxxx xxxx',
                  expiryDate: 'xx/xx',
                  balance: 'xx',
                  validAt: 'xx',
                  cvv: 'xxx',
                  logo: Assets.logo.appLauncher.path,
                  isNetworkImage: false,
                  cardHolderName: 'xxxxxx',
                  cardBankDetails: 'xxxxxx',
                  cardBgNetwork: controller
                      .strowalletCardInfoModel.data.data.cardBasicInfo.cardBg,
                ),
                // verticalSpace(Dimensions.heightSize * 0.5),
                // Row(
                //   mainAxisAlignment: mainCenter,
                //   children: [
                //     const TitleHeading3Widget(text: Strings.myCard),
                //     horizontalSpace(Dimensions.widthSize * 0.4),
                //     TitleHeading3Widget(
                //         text:
                //             '${contoller.strowalletCardModel.data.myCards.length}/${contoller.strowalletCardModel.data.cardBasicInfo.cardCreateLimit}'),
                //   ],
                // ),
              ],
            ),
    );
  }
}
