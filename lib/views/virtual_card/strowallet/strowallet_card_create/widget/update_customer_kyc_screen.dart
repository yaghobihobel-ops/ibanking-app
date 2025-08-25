import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../controller/strowallet_card_create_controller.dart';
import 'dynamic_image_widget.dart';

class UpdateCustomerKycScreen extends StatelessWidget {
  UpdateCustomerKycScreen({super.key});
  final controller = Get.put(StrowalletCardCreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.updateCustomerKyc,
      ),
      body: Obx(
        () => controller.isFieldLoading ? const Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Form(
        child: ListView(
          children: [
            Sizes.height.v10,
            PrimaryInputWidget(
              hintText: Strings.firstName,
              label: Strings.firstName,
              controller: controller.firstNameController,
              optionalText:
                  "(*${controller.strowalletCreatePageFieldModel.data.data.customerCreateFields[0].siteLabel})",
            ),
            Sizes.height.v10,
            PrimaryInputWidget(
              hintText: Strings.lastName,
              label: Strings.lastName,
              controller: controller.lastNameController,
              optionalText:
                  "(*${controller.strowalletCreatePageFieldModel.data.data.customerCreateFields[1].siteLabel})",
            ),
            Sizes.height.v10,
            DynamicImageCustomerWidget(
              labelName: controller.strowalletCreatePageFieldModel.data.data
                  .customerCreateFields[10].labelName,
              fieldName: 'user_image',
              // optionalText:
              //     "(${controller.strowalletCardCreateInfo.data.customerCreateFields[10].siteLabel})",
            ),
            Sizes.height.v10,
            DynamicImageCustomerWidget(
              labelName: controller.strowalletCreatePageFieldModel.data.data
                  .customerCreateFields[9].labelName,
              fieldName: 'id_image_font',
              // optionalText:
              //     "(${controller.strowalletCardCreateInfo.data.customerCreateFields[9].siteLabel})",
            ),
            Sizes.height.v10,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      TextWidget(
                        controller.strowalletCreatePageFieldModel.data.data
                            .customerCreateFields[9].labelName,
                      ),
                      Sizes.height.btnInputTitleAndBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        child: Image.network(
                          controller.idImage.value,
                          height: Dimensions.heightSize * 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Sizes.width.v15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      TextWidget(
                        controller.strowalletCreatePageFieldModel.data.data
                            .customerCreateFields[10].labelName,
                      ),
                      Sizes.height.btnInputTitleAndBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        child: Image.network(
                          controller.userPhoto.value,
                          height: Dimensions.heightSize * 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Sizes.height.v20,
            Obx(
              () => controller.isConfirmLoading
                  ? const Loader()
                  : PrimaryButton(
                      title: Strings.submit,
                      onPressed: () {
                        controller.updateCustomerKyc().then(
                          (v) {
                            Get.close(1);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
