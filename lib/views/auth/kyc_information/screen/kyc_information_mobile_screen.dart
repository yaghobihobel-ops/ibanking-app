part of 'kyc_information_screen.dart';

class KycInformationMobileScreen extends GetView<KycInformationController> {
  const KycInformationMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        '',
        backgroundColor: CustomColor.background,
      ),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          KycHeadingWidget(),
          KycInputWidget(),
        ],
      ),
    );
  }
}
