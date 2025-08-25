
part of 'strowallet_card_transaction_screen.dart';
class StrowalletCardTransactionTabletScreen extends GetView<StrowalletCardTransactionController> {
  const StrowalletCardTransactionTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('StrowalletCardTransaction Tablet Screen'),
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

