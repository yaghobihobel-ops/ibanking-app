import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';
import '../controller/transfer_money_controller.dart';
import 'beneficiary_add_widget.dart';

showBeneficiaryList(BuildContext context) {
  final controller = Get.put(BeneficiaryController());
  final transferMoneyController = Get.put(TransferMoneyController());
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Dimensions.radius * 1.5),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius * 1.5),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize,
          vertical: Dimensions.verticalSize * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: Dimensions.widthSize * 4.2,
                height: Dimensions.heightSize * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  color: Colors.black,
                ),
              ),
            ),
            Sizes.height.v20,
            TextWidget(
              Strings.selectBeneficiary,
              typographyStyle: TypographyStyle.titleSmall,
              fontWeight: FontWeight.bold,
              padding: EdgeInsets.only(
                bottom: Dimensions.verticalSize * 0.15,
              ),
            ),
            Sizes.height.betweenInputBox,
            Flexible(
              child: Obx(
                () => ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    controller.filteredBeneficiaryList.length,
                    (index) {
                      var data = controller.filteredBeneficiaryList[index];
                      // bool isSelected = transferMoneyController
                      //         .beneficiaryAccountNumber.value ==
                      //     data.accountNumber;
                      var imagePath =
                          controller.beneficiaryModel.data.imagePath;
                      return InkWell(
                        onTap: () {
                          if (transferMoneyController
                              .isSelectBeneficiaryLoading) {
                            return;
                          } else {
                            transferMoneyController
                                .selectBeneficiaryProcess(data.id)
                                .then((v) {
                              Get.close(1);
                            });
                          }
                        },
                        child: Card(
                          elevation: 0,
                          margin: EdgeInsets.only(
                            bottom: Dimensions.verticalSize * 0.4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              Dimensions.paddingSize * 0.5,
                            ),
                            child: Row(
                              mainAxisAlignment: mainSpaceBet,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                        Dimensions.paddingSize,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius * 1.5),
                                        color: CustomColor.background,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            controller
                                                        .filteredBeneficiaryList[
                                                            index]
                                                        .image !=
                                                    ""
                                                ? "${imagePath.baseUrl}/${imagePath.pathLocation}/${controller.filteredBeneficiaryList[index].image}"
                                                : "${imagePath.baseUrl}/${imagePath.defaultImage}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Sizes.width.v15,
                                    Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TextWidget(
                                          data.accountHolderName,
                                          typographyStyle:
                                              TypographyStyle.bodyLarge,
                                        ),
                                        TextWidget(
                                          data.accountNumber,
                                          typographyStyle:
                                              TypographyStyle.labelMedium,
                                          colorShade: ColorShade.mediumFifty,
                                        ),
                                        TextWidget(
                                          data.beneficiaryType,
                                          typographyStyle:
                                              TypographyStyle.labelSmall,
                                          colorShade: ColorShade.mediumFifty,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => transferMoneyController.isSelectBeneficiaryLoading
                  ? Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Sizes.height.v5,
                        LinearProgressIndicator(
                          minHeight: 0.5,
                          color: CustomColor.primary,
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ),
            if (controller.filteredBeneficiaryList.isEmpty)
              BeneficiaryAddWidget()
          ],
        ),
      );
    },
  );
}
