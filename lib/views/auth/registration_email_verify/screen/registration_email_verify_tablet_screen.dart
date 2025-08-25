
part of 'registration_email_verify_screen.dart';

class RegistrationEmailVerifyTabletScreen extends GetView<RegistrationEmailVerifyController> {
  const RegistrationEmailVerifyTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('RegistrationEmailVerify Tablet Screen'),
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

