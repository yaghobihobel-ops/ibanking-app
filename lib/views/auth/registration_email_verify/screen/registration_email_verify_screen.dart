import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../../base/widgets/timer_widget.dart';
import '../controller/registration_email_verify_controller.dart';
import '../widget/email_verify_button.dart';
import '../widget/email_verify_headline.dart';
import '../widget/email_verify_input.dart';

part 'registration_email_verify_mobile_screen.dart';
part 'registration_email_verify_tablet_screen.dart';

class RegistrationEmailVerifyScreen
    extends GetView<RegistrationEmailVerifyController> {
  const RegistrationEmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: RegistrationEmailVerifyMobileScreen(),
      tablet: RegistrationEmailVerifyTabletScreen(),
    );
  }
}
