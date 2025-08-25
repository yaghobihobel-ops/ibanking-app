import 'package:get/get.dart';

import '../views/virtual_card/strowallet/strowallet_details/controller/strowallet_details_controller.dart';

class StrowalletDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrowalletDetailsController());
  }
}
