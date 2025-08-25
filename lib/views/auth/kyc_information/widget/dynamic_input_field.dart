import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../widget/kyc_dynamic_dropdown.dart';
import '../widget/kyc_dynamic_image_widget.dart';

void getDynamicInputField({
  required List<dynamic> data,
  required List<TextEditingController> inputFieldControllers,
  required RxList<dynamic> inputFields,
  required RxList<dynamic> inputFileFields,
  required RxBool hasFile,
  bool isAvailableData = false,
  required RxString selectType,
  dynamic kycImagePaths,
}) {
  for (int item = 0; item < data.length; item++) {
    var textEditingController = TextEditingController();
    inputFieldControllers.add(textEditingController);

    if (data[item].type.contains('select')) {
      hasFile.value = true;
      if (isAvailableData) {
        selectType.value = data[item].value;
        textEditingController.text = data[item].value;
      } else {
        selectType.value = data[item].validation.options.first.toString();
        textEditingController.text = selectType.value;
      }

      var dropdownList = data[item].validation.options;
      inputFields.add(
        IgnorePointer(
          ignoring: isAvailableData,
          child: KycDynamicDropDown(
            label: data[item].label,
            selectMethod: selectType,
            itemsList: dropdownList,
            onChanged: (value) {
              selectType.value = value!;
              textEditingController.text = selectType.value;
              debugPrint(selectType.value);
            },
          ),
        ),
      );
    } else if (data[item].type.contains('file')) {
      hasFile.value = true;
      inputFileFields.add(
        UpdateKycImageWidget(
            labelName: data[item].label,
            fieldName: data[item].name,
            isAvailableData: isAvailableData,
            image: isAvailableData
                ? "${kycImagePaths.baseUrl}/${kycImagePaths.pathLocation}/${data[item].value}"
                : ''),
      );
    } else if (data[item].type.contains('text')) {
      inputFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.spaceBetweenInputTitleAndBox),
            PrimaryInputWidget(
              controller: textEditingController,
              hintText: '${Strings.enter} ${data[item].label}',
              label: data[item].label,
            ),
          ],
        ),
      );
    }
  }
}
