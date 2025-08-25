
part of 'strowallet_details_screen.dart';
class StrowalletDetailsTabletScreen extends GetView<StrowalletDetailsController> {
  const StrowalletDetailsTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('StrowalletDetails Tablet Screen'),
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

