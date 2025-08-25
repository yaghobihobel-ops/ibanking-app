import 'package:get/get.dart';

import '../views/saved_beneficiary/add_beneficiary/controller/add_beneficiary_controller.dart';

class AddBeneficiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBeneficiaryController());
  }
}
