part of 'login_screen.dart';

class LogInMobileScreen extends GetView<LogInController> {
  LogInMobileScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        '',
        showBackButton: false,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: ListView(
          children: [
            Sizes.height.v10,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: const BrandLogo(),
            ),
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
