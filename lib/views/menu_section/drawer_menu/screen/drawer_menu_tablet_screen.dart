
part of 'drawer_menu_screen.dart';
class DrawerMenuTabletScreen extends GetView<DrawerMenuController> {
  const DrawerMenuTabletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('DrawerMenu Tablet Screen'),
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

