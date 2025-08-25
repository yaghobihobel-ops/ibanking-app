
part of 'transfer_money_screen.dart';
class TransferMoneyTabletScreen extends GetView<TransferMoneyController> {
  const TransferMoneyTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('TransferMoney Tablet Screen'),
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

