import 'package:get/get.dart';

import '../views/auth/two_fa_verification_screen/controller/two_fa_verification_screen_controller.dart';

class TwoFaVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoFaVerificationScreenController());
  }
}
