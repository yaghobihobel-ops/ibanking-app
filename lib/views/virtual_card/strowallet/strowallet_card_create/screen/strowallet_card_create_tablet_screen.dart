
part of 'strowallet_card_create_screen.dart';
class StrowalletCardCreateTabletScreen extends GetView<StrowalletCardCreateController> {
  const StrowalletCardCreateTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('StrowalletCardCreate Tablet Screen'),
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

