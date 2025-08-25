part of 'login_screen.dart';

class LogInTabletScreen extends GetView<LogInController> {
  LogInTabletScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: ListView(
          children: [
            const HeadingWidget(),
            InputWidget(
              controller: controller,
            ),
            const LogInButtonWidget(),
            const DoNotHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
