part of 'dashboard_screen.dart';

class DashboardMobileScreen extends GetView<DashboardController> {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: CustomColor.primary,
      onRefresh: () async {
        controller.getDashboardInfo();
        Get.find<KycInformationController>().kycInfoProcess();
        Get.find<BeneficiaryController>().getBeneficiaryInfo();
      },
      child: ListView(
        children: [
          TopBarWidget(),
          FeatureSection(),
          KycStatusWidget(),
          QuickSend(),
          LatestPayments(),
        ],
      ),
    );
  }
}
