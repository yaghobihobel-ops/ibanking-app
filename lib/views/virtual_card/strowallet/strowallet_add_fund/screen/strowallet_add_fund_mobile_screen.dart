part of 'strowallet_add_fund_screen.dart';

class StrowalletAddFundMobileScreen
    extends GetView<StrowalletAddFundController> {
  const StrowalletAddFundMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.addFund),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        children: [
          StrowalletCardFundInputWidget(),
          StrowalletCardFundChargeScreen()
        ],
      ),
    );
  }
}
