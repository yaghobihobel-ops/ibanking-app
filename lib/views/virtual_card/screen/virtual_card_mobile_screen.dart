part of 'virtual_card_screen.dart';

class VirtualCardMobileScreen extends GetView<VirtualCardController> {
  VirtualCardMobileScreen({super.key});
  final kycInformationController = Get.put(KycInformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize * 0.6,
        ),
        child: RefreshIndicator(
          color: CustomColor.primary,
          onRefresh: () async {
            kycInformationController.kycInfoProcess();
            controller.getStrowalletInfo();
          },
          child: ListView(
            children: [
              if (kycInformationController.kycStatus == 1) ...[
                StrowalletSlider(),
              ] else ...[
                KycStatus(),
              ]
            ],
          ),
        ),
      ),
    );
  }

  _appBarWidget() {
    return CustomAppBar(
      Strings.virtualCard,
      showBackButton: false,
      action: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.strowalletCardCreateScreen);
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
    );
  }
}
