
part of 'two_fa_verification_screen_screen.dart';
class TwoFaVerificationScreenTabletScreen extends GetView<TwoFaVerificationScreenController> {
  const TwoFaVerificationScreenTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('TwoFaVerificationScreen Tablet Screen'),
      body: _bodyWidget(context),
    );
  }
  _bodyWidget(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}

