import 'package:get/get.dart';

import '../views/virtual_card/strowallet/strowallet_add_fund/controller/strowallet_add_fund_controller.dart';

class StrowalletAddFundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrowalletAddFundController());
  }
}
