part of 'registration_email_verify_screen.dart';

class RegistrationEmailVerifyMobileScreen
    extends GetView<RegistrationEmailVerifyController> {
  const RegistrationEmailVerifyMobileScreen({super.key});

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
        child: Column(
          children: [
            EmailVerifyHeadlineWidget(),
            EmailVerifyInputField(),
            TimerWidget(
              onResendCode: () {
                controller.onResendOtp;
              },
            ),
            EmailVerifyButton()
          ],
        ),
      ),
    );
  }
}
