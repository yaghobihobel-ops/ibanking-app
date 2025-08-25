part of 'drawer_menu_screen.dart';

class DrawerMenuMobileScreen extends GetView<DrawerMenuController> {
  const DrawerMenuMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        '${Strings.appName} ${DynamicLanguage.key(Strings.menu)}',
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          ProfileInfo(),
          OthersSection(),
        ],
      ),
    );
  }
}
