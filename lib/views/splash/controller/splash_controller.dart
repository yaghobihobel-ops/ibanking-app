import 'package:get/get.dart';

import '../../../base/utils/local_storage.dart';
import '../../../base/utils/navigator_plug.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  final navigatorPlug = NavigatorPlug();

  @override
  void onReady() {
    super.onReady();
    navigatorPlug.startListening(
      seconds: 3,
      onChanged: () {
        LocalStorage.isLoggedIn
            ? Get.offAndToNamed(Routes.navigation)
            : LocalStorage.onboardSave
                ? Get.offAndToNamed(Routes.loginScreen)
                : Get.offAndToNamed(Routes.onboardScreen);
      },
    );
  }

  @override
  void onClose() {
    navigatorPlug.stopListening();
    super.onClose();
  }
}
