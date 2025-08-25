import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../assets/assets.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../../base/widgets/divider.dart';
import '../../../../base/widgets/double_side_text_widget.dart';
import '../../model/beneficiary_model.dart';
import '../controller/beneficiary_controller.dart';

class BeneficiaryListWidget extends StatefulWidget {
  BeneficiaryListWidget({super.key});

  @override
  State<BeneficiaryListWidget> createState() => _BeneficiaryListWidgetState();
}

class _BeneficiaryListWidgetState extends State<BeneficiaryListWidget> {
  final controller = Get.put(BeneficiaryController());
  bool _showDetails = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.filteredBeneficiaryList.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 3,
                vertical: Dimensions.verticalSize * 0.5,
              ),
              child: Column(children: [
                Image.asset(Assets.icons.people.path),
                Sizes.height.v5,
                TextWidget(
                  Strings.noBeneficiaryFound,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.labelSmall * 0.9,
                ),
              ]),
            )
          : Flexible(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                  controller.filteredBeneficiaryList.length,
                  (index) {
                    var data = controller.filteredBeneficiaryList[index];
                    var imagePath = controller.beneficiaryModel.data.imagePath;
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showDetails = !_showDetails;
                            });
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius),
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.defaultHorizontalSize,
                              vertical: Dimensions.verticalSize * 0.18,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions.paddingSize * 0.3,
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
                                                TypographyStyle.titleMedium,
                                          ),
                                          TextWidget(
                                            data.accountNumber,
                                            typographyStyle:
                                                TypographyStyle.titleSmall,
                                            colorShade: ColorShade.mediumForty,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  _actionButtonWidget(context, index)
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_showDetails) _beneficiaryDetails(data)
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }

  _actionButtonWidget(BuildContext context, index) {
    var data = controller.filteredBeneficiaryList[index];
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(255, 254, 233, 232),
      child: IconButton(
        onPressed: () {
          controller.selectSlug.value = data.slug;
          showModalBottomSheet(
            context: context,
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
                    top: Radius.circular(
                      Dimensions.radius * 1.5,
                    ),
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
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius,
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Sizes.height.v15,
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      crossAxisAlignment: crossEnd,
                      children: [
                        TextWidget(
                          Strings.deleteBeneficiary,
                          typographyStyle: TypographyStyle.titleSmall,
                          fontWeight: FontWeight.bold,
                          padding: EdgeInsets.only(
                            bottom: Dimensions.verticalSize * 0.15,
                          ),
                        ),
                      ],
                    ),
                    TextWidget(
                      Strings.deleteBeneficiaryAlert,
                      typographyStyle: TypographyStyle.bodyMedium,
                    ),
                    Sizes.height.betweenInputBox,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.verticalSize * 0.4,
                      ),
                      child: Obx(
                        () => Column(
                          children: [
                            PrimaryButton(
                              title: Strings.cancel,
                              onPressed: () {
                                Get.close(1);
                              },
                              buttonColor: Colors.white,
                              borderColor: Colors.white,
                              buttonTextColor: Colors.black,
                            ),
                            Sizes.height.v10,
                            PrimaryButton(
                              title: Strings.delete,
                              isLoading: controller.isDeleteLoading,
                              onPressed: () {
                                controller.deleteBeneficiary();
                              },
                              buttonColor: Colors.red,
                              borderColor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }

  _beneficiaryDetails(Beneficiary data) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.18,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSize * 0.5,
        ),
        child: Column(
          children: [
            DoubleSideTextWidget(
              keys: Strings.transactionType,
              value: data.beneficiaryType,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.beneficiarySubType,
              value: data.beneficiarySubtype,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.bankName,
              value: data.bankName,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.accountNumber,
              value: data.accountNumber,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.accountHolderName,
              value: data.accountHolderName,
              valueStyle: TypographyStyle.bodyMedium,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.accountHolderEmail,
              value: data.email,
              valueStyle: TypographyStyle.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
