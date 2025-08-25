import 'package:get/get.dart';

import '../views/auth/kyc_information/controller/kyc_information_controller.dart';

class KycInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycInformationController());
  }
}
