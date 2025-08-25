import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../controller/pin_setup_controller.dart';

part 'pin_setup_mobile_screen.dart';
part 'pin_setup_tablet_screen.dart';

class PinSetupScreen extends GetView<PinSetupController> {
  const PinSetupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: PinSetupMobileScreen(),
      tablet: PinSetupTabletScreen(),
    );
  }
}
