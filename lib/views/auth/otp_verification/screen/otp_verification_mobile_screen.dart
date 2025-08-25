part of 'otp_verification_screen.dart';

class OtpVerificationMobileScreen extends GetView<OtpVerificationController> {
  const OtpVerificationMobileScreen({super.key});

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
            OtpHeadlineWidget(),
            ResetOtpInputField(),
            TimerWidget(
              onResendCode: () {
                controller.onResendOtp;
              },
            ),
            OtpSubmitButton(),
          ],
        ),
      ),
    );
  }
}
