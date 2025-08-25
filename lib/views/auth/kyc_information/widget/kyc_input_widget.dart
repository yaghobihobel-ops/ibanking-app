import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/local_storage.dart';
import 'package:ibanking/views/auth/kyc_information/controller/kyc_information_controller.dart';

import '../../../../base/utils/basic_import.dart';

class KycInputWidget extends GetView<KycInformationController> {
  const KycInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainMin,
      children: [
        _inputsWidget(context),
      ],
    );
  }

  _inputsWidget(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: mainMin,
        children: [
          ...controller.inputFields.map((element) {
            return element;
          }).toList(),
          _kycNoteWidget(context),
          _filePickerWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _filePickerWidget(BuildContext context) {
    return Flexible(
      child: Visibility(
        visible: controller.inputFileFields.isNotEmpty,
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
          ),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.2,
          ),
          itemCount: controller.inputFileFields.length,
          itemBuilder: (BuildContext context, int index) {
            return controller.inputFileFields[index];
          },
        ),
      ),
    );
  }

  _kycNoteWidget(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSize * 0.55,
              vertical: Dimensions.verticalSize * 0.5,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
                  decoration: BoxDecoration(
                    color: CustomColor.background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.description_outlined),
                ),
                Sizes.width.v10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    mainAxisSize: mainMin,
                    children: [
                      TextWidget(
                        Strings.proofOfIdentity,
                        typographyStyle: TypographyStyle.titleMedium,
                        style: CustomStyle.titleMedium.copyWith(),
                      ),
                      TextWidget(
                        Strings.submitValidDocuments,
                        fontSize: Dimensions.labelSmall * 0.9,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Sizes.height.v15,
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.kycStatus.value == 0 || controller.kycStatus.value == 3
          ? Container(
              margin: EdgeInsets.only(
                left: Dimensions.defaultHorizontalSize,
                right: Dimensions.defaultHorizontalSize,
              ),
              child: Column(
                mainAxisSize: mainMin,
                children: [
                  Sizes.height.v15,
                  PrimaryButton(
                    title: controller.kycInfoModel.data.kycStatus == 3
                        ? Strings.resubmit
                        : Strings.submit,
                    isLoading: controller.isSubmitLoading,
                    // disable: !controller.isFormValid.value,
                    onPressed: () {
                      if (controller.kycInfoModel.data.kycStatus == 3 &&
                          !controller.showSubmitForm.value) {
                        controller.showSubmitForm.value = true;
                        controller.kycInfoProcess();
                      } else {
                        controller.kycSubmitProcess();
                      }
                    },
                  ),
                  if (!LocalStorage.isLoggedIn)
                    Column(
                      children: [
                        Sizes.height.v15,
                        TextWidget(
                          Strings.skipNow,
                          fontWeight: FontWeight.w400,
                          onTap: () {
                            controller.onSkip();
                          },
                        ),
                      ],
                    ),
                  Sizes.height.v15,
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
