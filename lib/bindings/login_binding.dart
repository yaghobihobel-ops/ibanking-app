import 'package:get/get.dart';
import 'package:ibanking/views/auth/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
  }
}
