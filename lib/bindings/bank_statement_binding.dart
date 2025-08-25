import 'package:get/get.dart';

import '../views/bank_statement/controller/bank_statement_controller.dart';

class BankStatementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankStatementController());
  }
}
