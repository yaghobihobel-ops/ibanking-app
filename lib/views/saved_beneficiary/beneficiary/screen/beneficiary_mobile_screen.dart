part of 'beneficiary_screen.dart';

class BeneficiaryMobileScreen extends GetView<BeneficiaryController> {
  const BeneficiaryMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.beneficiary,
        showBackButton: false,
        action: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.addBeneficiaryScreen);
            },
            child: CircleAvatar(
              backgroundColor: CustomColor.primary,
              radius: Dimensions.radius * 1.3,
              child: Icon(
                Icons.add,
                color: CustomColor.whiteColor,
              ),
            ),
          ),
          Sizes.width.v15,
        ],
      ),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getBeneficiaryInfo();
        },
        child: Column(
          children: [
            BeneficiarySearchWidget(),
            BeneficiaryListWidget(),
          ],
        ),
      ),
    );
  }
}
