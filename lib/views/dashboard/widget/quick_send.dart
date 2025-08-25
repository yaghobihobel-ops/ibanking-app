import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';
import 'package:ibanking/views/saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../../transfer_money/controller/transfer_money_controller.dart';
import '../../transfer_money/widget/beneficiary_add_widget.dart';

class QuickSend extends StatelessWidget {
  QuickSend({super.key});
  final controller = Get.put(BeneficiaryController());
  final transferMoneyController = Get.put(TransferMoneyController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? Text('')
          : controller.filteredBeneficiaryList.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.8,
                    vertical: Dimensions.verticalSize * 0.5,
                  ),
                  child: BeneficiaryAddWidget(),
                )
              : Card(
                  elevation: 0,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.8,
                    vertical: Dimensions.verticalSize * 0.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        TextWidget(
                          Strings.fundTransfer,
                          typographyStyle: TypographyStyle.titleMedium,
                          fontWeight: FontWeight.w600,
                        ),
                        Sizes.height.v10,
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              controller.filteredBeneficiaryList.length + 1,
                              (index) {
                                var imagePath =
                                    controller.beneficiaryModel.data.imagePath;
                                if (index == 0) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.addBeneficiaryScreen);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.horizontalSize * 0.2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: CustomColor.background,
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.radius,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(
                                        Dimensions.paddingSize * 0.3,
                                      ),
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: CustomColor.typography,
                                      ),
                                    ),
                                  );
                                }

                                return InkWell(
                                  onTap: () {
                                    if (!transferMoneyController
                                        .isSelectBeneficiaryLoading) {
                                      transferMoneyController
                                              .selectedBeneficiaryId.value =
                                          controller
                                              .filteredBeneficiaryList[
                                                  index - 1]
                                              .id;
                                      transferMoneyController
                                          .selectBeneficiaryProcess(controller
                                              .filteredBeneficiaryList[
                                                  index - 1]
                                              .id)
                                          .then(
                                        (v) {
                                          Get.toNamed(
                                              Routes.transferMoneyScreen);
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.horizontalSize * 0.2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: CustomColor.background,
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.radius,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(
                                      Dimensions.paddingSize * 0.3,
                                    ),
                                    child: Column(
                                      children: [
                                        if (transferMoneyController
                                                .isSelectBeneficiaryLoading &&
                                            transferMoneyController
                                                    .selectedBeneficiaryId ==
                                                controller
                                                    .filteredBeneficiaryList[
                                                        index - 1]
                                                    .id) ...[
                                          CircleAvatar(
                                            radius: Dimensions.radius * 1.6,
                                            backgroundColor:
                                                CustomColor.primary,
                                            child: Icon(
                                              Icons.check_rounded,
                                              color: CustomColor.whiteColor,
                                            ),
                                          ),
                                        ] else ...[
                                          CircleAvatar(
                                            radius: Dimensions.radius * 1.8,
                                            backgroundColor:
                                                CustomColor.background,
                                            backgroundImage: NetworkImage(
                                              controller
                                                          .filteredBeneficiaryList[
                                                              index - 1]
                                                          .image !=
                                                      ""
                                                  ? "${imagePath.baseUrl}/${imagePath.pathLocation}/${controller.filteredBeneficiaryList[index - 1].image}"
                                                  : "${imagePath.baseUrl}/${imagePath.defaultImage}",
                                            ),
                                          ),
                                        ],
                                        Sizes.height.v5,
                                        TextWidget(
                                          controller
                                              .filteredBeneficiaryList[
                                                  index - 1]
                                              .accountHolderName,
                                          typographyStyle:
                                              TypographyStyle.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (transferMoneyController.isSelectBeneficiaryLoading)
                          Column(
                            crossAxisAlignment: crossStart,
                            children: [
                              Sizes.height.v10,
                              LinearProgressIndicator(
                                minHeight: 0.5,
                                color: CustomColor.primary,
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
    );
  }
}
