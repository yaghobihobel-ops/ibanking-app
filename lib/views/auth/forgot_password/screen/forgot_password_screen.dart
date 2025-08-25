import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/forgot_password/widget/forgot_password_heading.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/forgot_password_controller.dart';
import '../widget/forgot_password_input.dart';

part 'forgot_password_mobile_screen.dart';
part 'forgot_password_tablet_screen.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ForgotPasswordMobileScreen(),
      tablet: ForgotPasswordTabletScreen(),
    );
  }
}
