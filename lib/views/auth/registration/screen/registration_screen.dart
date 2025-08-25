import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../login/widget/brand_logo.dart';
import '../controller/registration_controller.dart';
import '../widget/agree_widget.dart';
import '../widget/already_account.dart';
import '../widget/reg_button.dart';
import '../widget/reg_hedline.dart';
import '../widget/req_input_widget.dart';

part 'registration_mobile_screen.dart';
part 'registration_tablet_screen.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: RegistrationMobileScreen(),
      tablet: const RegistrationTabletScreen(),
    );
  }
}
