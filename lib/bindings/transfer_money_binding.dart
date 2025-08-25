import 'package:get/get.dart';
import 'package:ibanking/views/transfer_money/controller/transfer_money_controller.dart';

class TransferMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferMoneyController());
  }
}
