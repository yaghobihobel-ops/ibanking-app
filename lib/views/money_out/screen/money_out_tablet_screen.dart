
part of 'money_out_screen.dart';
class MoneyOutTabletScreen extends GetView<MoneyOutController> {
  const MoneyOutTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('MoneyOut Tablet Screen'),
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

