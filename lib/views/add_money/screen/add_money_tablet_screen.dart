
part of 'add_money_screen.dart';
class AddMoneyTabletScreen extends GetView<AddMoneyController> {
  const AddMoneyTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('AddMoney Tablet Screen'),
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

