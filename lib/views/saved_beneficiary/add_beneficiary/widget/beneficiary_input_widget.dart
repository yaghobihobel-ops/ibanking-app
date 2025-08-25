import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/saved_beneficiary/add_beneficiary/controller/add_beneficiary_controller.dart';

import '../../../../base/api/services/check_kyc.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../../routes/routes.dart';
import '../../../dashboard/controller/dashboard_controller.dart';
import '../../model/beneficiary_bank_model.dart';
import '../../model/beneficiary_method_model.dart';

class BeneficiaryInputWidget extends StatelessWidget {
  BeneficiaryInputWidget({super.key});
  final controller = Get.put(AddBeneficiaryController());
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isOwnBank =
            controller.beneficiaryType.value!.slug != 'other-bank-transfer';
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSize,
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              CustomDropDown<MethodModel>(
                label: Strings.beneficiaryType,
                itemsList: controller.beneficiaryMethodList,
                selectMethod: controller.beneficiaryType.value!.name.obs,
                onChanged: (v) {
                  controller.beneficiaryType.value = v!;
                },
              ),
              if (controller.beneficiaryType.value!.name !=
                  Strings.selectType) ...[
                CustomDropDown<String>(
                  label: Strings.selectType,
                  itemsList: controller.typeList,
                  selectMethod: controller.accountType,
                  onChanged: (v) {
                    controller.accountType.value = v!;
                  },
                ),
              ],
              if (controller.beneficiaryType.value!.slug ==
                      'other-bank-transfer' &&
                  controller.accountType.value != Strings.selectType) ...[
                CustomDropDown<BankList>(
                  label: Strings.selectBank,
                  itemsList: controller.beneficiaryBankList,
                  selectMethod: controller.selectBank.value!.bankName.obs,
                  onChanged: (v) {
                    controller.selectBank.value = v!;
                    controller.selectBranch.value = Branch(
                      id: 0,
                      name: Strings.selectBranch,
                    );

                    controller.beneficiaryBranchList.value = controller
                        .beneficiaryBankList
                        .where((bank) =>
                            bank.bankId == controller.selectBank.value!.bankId)
                        .first
                        .branches;
                  },
                ),
                Obx(
                  () => CustomDropDown<Branch>(
                    label: Strings.selectBranch,
                    itemsList: controller.beneficiaryBranchList,
                    selectMethod: controller.selectBranch.value!.name.obs,
                    onChanged: (v) {
                      controller.selectBranch.value = v!;
                    },
                  ),
                ),
              ],
              if (controller.accountType.value != Strings.selectType) ...[
                Sizes.height.btnInputTitleAndBox,
                PrimaryInputWidget(
                  controller: controller.accountNumberController,
                  label: Strings.accountNumber,
                  hintText: Strings.accountNumber,
                  textInputType: TextInputType.number,
                  showBorderSide: true,
                  onChanged: (v) {
                    if (controller.beneficiaryType.value!.slug !=
                        'other-bank-transfer') {
                      checkKycStatus(
                        onSuccess: () {
                          if (dashboardController.setPinStatus.value == 0) {
                            CustomSnackBar.error(Strings.pleaseSetupYour);
                            Get.toNamed(Routes.pinSetupScreen);
                          } else {
                            controller.accountDetails(accountNumber: v);
                          }
                        },
                      );
                    }
                  },
                ),
                Obx(
                  () => controller.accountDetailsStatus.value != ''
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: Dimensions.verticalSize * 0.2,
                          ),
                          child: TextWidget(
                            controller.accountDetailsStatus.value,
                            typographyStyle: TypographyStyle.labelSmall,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                Sizes.height.btnInputTitleAndBox,
                PrimaryInputWidget(
                  controller: controller.accountHolderNameController,
                  label: Strings.accountHolderName,
                  hintText: Strings.accountHolderName,
                  textInputType: TextInputType.text,
                  showBorderSide: true,
                  readOnly: isOwnBank,
                ),
                Sizes.height.btnInputTitleAndBox,
                PrimaryInputWidget(
                  controller: controller.emailController,
                  label: Strings.email,
                  hintText: Strings.email,
                  textInputType: TextInputType.emailAddress,
                  showBorderSide: true,
                  readOnly: isOwnBank,
                ),
                Sizes.height.btnInputTitleAndBox,
              ],
              if (controller.beneficiaryType.value!.slug ==
                      'other-bank-transfer' &&
                  controller.accountType.value != Strings.selectType) ...[
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    PrimaryInputWidget(
                      controller: controller.phoneController,
                      label: Strings.phone,
                      hintText: Strings.phone,
                      textInputType: TextInputType.number,
                      showBorderSide: true,
                    ),
                    Sizes.height.v20,
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
