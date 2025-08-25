import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';

import '../../../../base/api/services/basic_services.dart';
import '../../../../base/widgets/country_drop_down.dart';
import '../controller/registration_controller.dart';

class RegInputWidget extends GetView<RegistrationController> {
  const RegInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDropDown(
            label: Strings.accountType,
            itemsList: controller.accountType,
            selectMethod: controller.selectAccountType,
            onChanged: (v) {
              controller.selectAccountType.value = v!;
            },
          ),
          Sizes.height.betweenInputBox,
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  label: Strings.firstName,
                  hintText: Strings.name,
                  textInputType: TextInputType.text,
                ),
              ),
              Sizes.width.v15,
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.lastNameController,
                  label: Strings.lastName,
                  hintText: Strings.name,
                  textInputType: TextInputType.text,
                ),
              ),
            ],
          ),
          Visibility(
            visible:
                controller.selectAccountType.value == Strings.businessAccount,
            child: Column(
              children: [
                Sizes.height.betweenInputBox,
                PrimaryInputWidget(
                  controller: controller.companyNameController,
                  label: Strings.companyName,
                  hintText: Strings.companyName,
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          Sizes.height.betweenInputBox,
          PrimaryInputWidget(
            controller: controller.emailAddressController,
            label: Strings.emailAddress,
            hintText: Strings.emailAddress,
            textInputType: TextInputType.emailAddress,
          ),
          Sizes.height.betweenInputBox,
          CountryDropDown(
            itemsList: BasicServices.countryList,
            label: Strings.country,
            selectMethod: controller.countrySelectMethod,
            onChanged: (v) {
              controller.countrySelectMethod.value = v!.name;
            },
          ),
          Sizes.height.betweenInputBox,
          PrimaryInputWidget(
            controller: controller.passwordController,
            label: Strings.password,
            hintText: Strings.password,
            textInputType: TextInputType.text,
            isPasswordField: true,
          ),
        ],
      ),
    );
  }
}
