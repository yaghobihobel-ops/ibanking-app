import 'package:get/get.dart';

import '../views/virtual_card/strowallet/strowallet_card_transaction/controller/strowallet_card_transaction_controller.dart';

class StrowalletCardTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrowalletCardTransactionController());
  }
}
