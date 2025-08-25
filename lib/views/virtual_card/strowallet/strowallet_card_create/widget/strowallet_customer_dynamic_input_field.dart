import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/menu_section/profile/controller/profile_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../model/strowallet/strowallet_create_page_field_model.dart';
import 'dynamic_image_widget.dart';

void getCustomerDynamicInputField({
  required List<CreateField> data,
  required List<TextEditingController> inputFieldControllers,
  required RxList<dynamic> inputFields,
  required RxList<dynamic> inputFileFields,
  required RxBool hasFile,
  required RxString selectType,
}) {
  final updateProfileController = Get.put(ProfileController());

  for (int item = 0; item < data.length; item++) {
    if (data[item].type.contains('number')) {
      inputFieldControllers.add(updateProfileController.mobileController);
    } else if (data[item].type.contains('email')) {
      inputFieldControllers.add(updateProfileController.emailController);
    } else {
      var textEditingController = TextEditingController();
      inputFieldControllers.add(textEditingController);
    }

    if (data[item].type.contains('file')) {
      hasFile.value = true;
      inputFields.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DynamicImageCustomerWidget(
            labelName: data[item].labelName,
            fieldName: data[item].fieldName,
            // optionalLabel: data[item].siteLabel != ''
            //     ? "(*${data[item].siteLabel})"
            //     : data[item].siteLabel,
          ),
        ),
      );
    } else if (data[item].type.contains('text') ||
        data[item].type.contains('textarea') ||
        data[item].type.contains('email') ||
        data[item].type.contains('number')) {
      if (data[item].type.contains('number')) {
        if (data[item].fieldName.contains('phone_code')) {
        } else {
          inputFields.add(
            Padding(
              padding: EdgeInsets.only(
                bottom: Dimensions.heightSize * 0.5,
              ),
              child: PrimaryInputWidget(
                readOnly: false,
                controller: updateProfileController.mobileController,
                label: data[item].labelName,
                hintText: "${data[item].labelName}",
                optionalText: data[item].siteLabel != ''
                    ? "(*${data[item].siteLabel})"
                    : data[item].siteLabel,
                isValidator: false,
              ),
            ),
          );
        }
      } else {
        inputFields.add(
          Column(
            children: [
              PrimaryInputWidget(
                customPadding: EdgeInsets.only(
                  left: Dimensions.widthSize,
                  right: Dimensions.widthSize,
                  top: Dimensions.heightSize * 0.5,
                ),
                controller: inputFieldControllers[item],
                label: data[item].labelName,
                hintText: "${data[item].labelName}",
                optionalText: data[item].siteLabel != ''
                    ? "*(${data[item].siteLabel})"
                    : data[item].siteLabel,
                isValidator: true,
              ),
              Sizes.height.v10,
            ],
          ),
        );
      }
    } else if (data[item].type.contains('date')) {
      inputFields.add(
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.heightSize * 0.5,
          ),
          child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2300),
              );
              if (pickedDate != null) {
                final DateFormat formatter = DateFormat('dd/mm/yyyy');
                final String formattedDate = formatter.format(pickedDate);
                inputFieldControllers[item].text = formattedDate;

                print(formattedDate);
              }
            },
            child: AbsorbPointer(
              child: PrimaryInputWidget(
                controller: inputFieldControllers[item],
                label: data[item].labelName,
                hintText: "${data[item].labelName}",
                optionalText: data[item].siteLabel != ''
                    ? "*(${data[item].siteLabel})"
                    : data[item].siteLabel,
                isValidator: true,
              ),
            ),
          ),
        ),
      );
    }
  }
}
