import 'package:get/get.dart';

import '../views/virtual_card/strowallet/strowallet_card_create/controller/strowallet_card_create_controller.dart';

class StrowalletCardCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrowalletCardCreateController());
  }
}
