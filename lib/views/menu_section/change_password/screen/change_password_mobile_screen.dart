part of 'change_password_screen.dart';

class ChangePasswordMobileScreen extends GetView<ChangePasswordController> {
  const ChangePasswordMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.changePassword),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize * 0.8,
        ),
        child: Column(
          children: [
            Sizes.height.betweenInputBox,
            PrimaryInputWidget(
              controller: controller.oldPasswordController,
              label: Strings.oldPassword,
              hintText: Strings.oldPassword,
              textInputType: TextInputType.visiblePassword,
              showBorderSide: true,
              isPasswordField: true,
            ),
            Sizes.height.betweenInputBox,
            PrimaryInputWidget(
              controller: controller.newPasswordController,
              label: Strings.newPassword,
              hintText: Strings.newPassword,
              textInputType: TextInputType.visiblePassword,
              showBorderSide: true,
              isPasswordField: true,
            ),
            Sizes.height.betweenInputBox,
            PrimaryInputWidget(
              controller: controller.confirmPasswordController,
              label: Strings.confirmPassword,
              hintText: Strings.confirmPassword,
              textInputType: TextInputType.visiblePassword,
              showBorderSide: true,
              isPasswordField: true,
            ),
            Sizes.height.betweenInputBox,
            Obx(
              () => PrimaryButton(
                isLoading: controller.isLoading,
                title: Strings.changePassword,
                disable: !controller.isFormValid.value,
                onPressed: () {
                  if (controller.isFormValid.value) {
                    controller.changePasswordProcess();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
