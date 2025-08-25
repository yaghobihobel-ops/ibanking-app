part of 'reset_password_screen.dart';

class ResetPasswordMobileScreen extends GetView<ResetPasswordController> {
  const ResetPasswordMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        '',
        backgroundColor: CustomColor.background,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: const Column(
          children: [
            ResetPasswordHeadline(),
            ResetPasswordInputWidget(),
            ResetPasswordSubmitButton()
          ],
        ),
      ),
    );
  }
}
