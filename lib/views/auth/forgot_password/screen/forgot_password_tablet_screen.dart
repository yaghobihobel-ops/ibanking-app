
part of 'forgot_password_screen.dart';
class ForgotPasswordTabletScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('ForgotPassword Tablet Screen'),
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

