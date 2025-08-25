part of 'two_fa_verification_screen_screen.dart';

class TwoFaVerificationScreenMobileScreen
    extends GetView<TwoFaVerificationScreenController> {
  const TwoFaVerificationScreenMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.twoFaVerification),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: Column(
          children: [
            TwoFaOtpHeadlineWidget(),
            TwoFaOtpInput(),
            TwoFaOtpSubmitButton(),
          ],
        ),
      ),
    );
  }
}
