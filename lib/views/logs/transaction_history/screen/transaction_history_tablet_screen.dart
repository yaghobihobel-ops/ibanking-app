
part of 'transaction_history_screen.dart';
class TransactionHistoryTabletScreen extends GetView<TransactionHistoryController> {
  const TransactionHistoryTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('TransactionHistory Tablet Screen'),
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

