import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';

import '../controller/money_out_controller.dart';

class InstructionsFieldWidget extends StatelessWidget {
  InstructionsFieldWidget({super.key});
  final controller = Get.put(MoneyOutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.paymentInstructions),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: ListView(
        children: [
          _content(context),
          _inputsWidget(context),
        ],
      ),
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
          Sizes.height.btnInputTitleAndBox,
          _filePickerWidget(context),
          Sizes.height.btnInputTitleAndBox,
          _buttonWidget(context),
          Sizes.height.btnInputTitleAndBox,
        ],
      ),
    );
  }

  _filePickerWidget(BuildContext context) {
    return Visibility(
      visible: controller.inputFileFields.isNotEmpty,
      child: Flexible(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.6,
          ),
          itemCount: controller.inputFileFields.length,
          itemBuilder: (BuildContext context, int index) {
            return controller.inputFileFields[index];
          },
        ),
      ),
    );
  }

  _content(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.4,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Column(
        children: [
          TextWidget(
            controller.instructionModel.data.desc,
            typographyStyle: TypographyStyle.labelSmall,
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        isLoading: controller.isInstructionsConfirmLoading,
        onPressed: () {
          controller.instructionsSubmit();
        },
      ),
    );
  }
}
