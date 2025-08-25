import 'package:get/get.dart';

import '../views/pin_setup/controller/pin_setup_controller.dart';

class SetupPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PinSetupController());
  }
}
