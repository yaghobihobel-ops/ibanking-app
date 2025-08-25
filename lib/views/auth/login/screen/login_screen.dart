import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/login_controller.dart';
import '../widget/brand_logo.dart';
import '../widget/do_not_have_an_account.dart';
import '../widget/heading.dart';
import '../widget/input_widget.dart';
import '../widget/log_in_button.dart';

part 'login_mobile_screen.dart';
part 'login_tablet_screen.dart';

class LoginScreen extends GetView<LogInController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LogInMobileScreen(),
      tablet: LogInTabletScreen(),
    );
  }
}
