import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';

import '../../../../base/widgets/country_drop_down.dart';
import '../../../../base/widgets/custom_date_picker.dart';
import '../controller/profile_controller.dart';

class ProfileInputWidget extends StatelessWidget {
  ProfileInputWidget({Key? key}) : super(key: key);

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  label: Strings.firstName,
                  hintText: Strings.firstName,
                  textInputType: TextInputType.name,
                  showBorderSide: true,
                ),
              ),
              Sizes.width.v10,
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.lastNameController,
                  label: Strings.lastName,
                  hintText: Strings.lastName,
                  textInputType: TextInputType.name,
                  showBorderSide: true,
                ),
              ),
            ],
          ),
          Sizes.height.betweenInputBox,
          CountryDropDown(
            label: Strings.country,
            itemsList: controller.countryList,
            subtitle: Strings.country,
            selectMethod: controller.countrySelectMethod,
            onChanged: (v) {
              controller.countrySelectMethod.value = v!.name;
            },
          ),
          Sizes.height.betweenInputBox,
          CustomDropDown<String>(
            label: Strings.gender,
            itemsList: controller.genderList,
            selectMethod: controller.selectedGender,
            onChanged: (v) {
              controller.selectedGender.value = v!;
            },
          ),
          Sizes.height.betweenInputBox,
          CustomDatePicker(
            label: Strings.dateOfBirth,
            selectedDate: controller.selectedDate,
          ),
          Sizes.height.betweenInputBox,
          PrimaryInputWidget(
            controller: controller.mobileController,
            label: Strings.phone,
            hintText: Strings.phone,
            textInputType: TextInputType.phone,
            showBorderSide: true,
          ),
          Sizes.height.betweenInputBox,
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.addressController,
                  label: Strings.address,
                  hintText: Strings.address,
                  textInputType: TextInputType.streetAddress,
                  showBorderSide: true,
                ),
              ),
              Sizes.width.v10,
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.cityController,
                  label: Strings.city,
                  hintText: Strings.city,
                  textInputType: TextInputType.text,
                  showBorderSide: true,
                ),
              ),
            ],
          ),
          Sizes.height.betweenInputBox,
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.stateController,
                  label: Strings.state,
                  hintText: Strings.state,
                  textInputType: TextInputType.text,
                  showBorderSide: true,
                ),
              ),
              Sizes.width.v10,
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.postalCodeController,
                  label: Strings.zipCode,
                  hintText: Strings.zipCode,
                  textInputType: TextInputType.number,
                  showBorderSide: true,
                ),
              ),
            ],
          ),
          Sizes.height.v15,
        ],
      ),
    );
  }
}
