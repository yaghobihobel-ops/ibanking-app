part of 'pin_setup_screen.dart';

class PinSetupMobileScreen extends GetView<PinSetupController> {
  const PinSetupMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(controller.controller.setPinStatus.value == 0
          ? Strings.setupPin
          : Strings.updatePin),
      body: Obx(
        () => controller.controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Column(
          children: [
            if (controller.controller.setPinStatus.value == 0) ...[
              _setPinWidget(context),
            ] else ...[
              _updatePinWidget(context),
            ]
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.5,
      ),
      child: Obx(
        () => PrimaryButton(
          title: controller.controller.setPinStatus.value == 0
              ? Strings.submit
              : Strings.update,
          isLoading: controller.isSubmitLoading,
          disable: !controller.isFormValid.value,
          onPressed: () {
            if (controller.controller.setPinStatus.value == 0) {
              controller.storePin();
            } else {
              controller.updateSetupPin();
            }
          },
        ),
      ),
    );
  }

  _updatePinWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryInputWidget(
          controller: controller.oldPinCodeController,
          label: Strings.oldPin,
          hintText: Strings.oldPin,
          textInputType: TextInputType.text,
          showBorderSide: true,
        ),
        Sizes.height.betweenInputBox,
        PrimaryInputWidget(
          controller: controller.newPinCodeController,
          label: Strings.newPin,
          hintText: Strings.newPin,
          textInputType: TextInputType.text,
          showBorderSide: true,
        ),
        _buttonWidget(context),
      ],
    );
  }

  _setPinWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryInputWidget(
          controller: controller.pinCodeController,
          label: Strings.setupPin,
          hintText: Strings.setYourPin,
          skipEnterText: true,
          textInputType: TextInputType.text,
          showBorderSide: true,
        ),
        _buttonWidget(context),
      ],
    );
  }
}
