
part of 'virtual_card_screen.dart';
class VirtualCardTabletScreen extends GetView<VirtualCardController> {
  const VirtualCardTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('VirtualCard Tablet Screen'),
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

