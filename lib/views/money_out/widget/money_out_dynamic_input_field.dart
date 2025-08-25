import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../base/widgets/dynamic_image_widget.dart';
import '../model/instruction_model.dart';

void moneyOutDynamicInputField({
  required List<InputField> data,
  required List<TextEditingController> inputFieldControllers,
  required RxList<dynamic> inputFields,
  required RxList<dynamic> inputFileFields,
  required RxBool hasFile,
  required RxString selectType,
}) {
  for (int item = 0; item < data.length; item++) {
    var textEditingController = TextEditingController();
    inputFieldControllers.add(textEditingController);

    if (data[item].type.contains('file')) {
      hasFile.value = true;
      inputFileFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(data[item].label),
            SizedBox(height: Dimensions.spaceBetweenInputTitleAndBox),
            DynamicImageWidget(
              labelName: data[item].label,
              fieldName: data[item].name,
            ),
          ],
        ),
      );
    } else if (data[item].type.contains('text')) {
      inputFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.spaceBetweenInputTitleAndBox),
            PrimaryInputWidget(
              controller: textEditingController,
              hintText: '${data[item].label}',
              label: data[item].label,
            ),
          ],
        ),
      );
    }
  }
}
