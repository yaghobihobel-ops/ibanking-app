
part of 'strowallet_add_fund_screen.dart';
class StrowalletAddFundTabletScreen extends GetView<StrowalletAddFundController> {
  const StrowalletAddFundTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('StrowalletAddFund Tablet Screen'),
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

