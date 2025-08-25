// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_languages/dynamic_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _dropDown(context);
  }

  _dropDown(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.ltr,
        child: DropdownButton2<String>(
          isDense: false,
          isExpanded: false,
          iconStyleData: IconStyleData(
            icon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: CustomColor.primary,
              ),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: MediaQuery.sizeOf(context).height * .26,
            decoration: BoxDecoration(
              color: CustomColor.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
          ),
          value: DynamicLanguage.selectedLanguage.value,
          underline: Container(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              DynamicLanguage.changeLanguage(newValue);
            }
          },
          items: DynamicLanguage.languages.map<DropdownMenuItem<String>>(
            (language) {
              return DropdownMenuItem<String>(
                value: language.code,
                child: TextWidget(
                  language.name,
                  color: CustomColor.primary,
                  typographyStyle: TypographyStyle.labelLarge,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
