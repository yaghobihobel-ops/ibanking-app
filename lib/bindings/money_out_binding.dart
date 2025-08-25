import 'package:get/get.dart';

import '../views/money_out/controller/money_out_controller.dart';

class MoneyOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoneyOutController());
  }
}
