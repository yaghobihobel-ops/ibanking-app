import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/auth/otp_verification/widget/otp_headline.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../../base/widgets/timer_widget.dart';
import '../controller/otp_verification_controller.dart';
import '../widget/otp_submit_button.dart';
import '../widget/reset_otp_input.dart';

part 'otp_verification_mobile_screen.dart';
part 'otp_verification_tablet_screen.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: OtpVerificationMobileScreen(),
      tablet: OtpVerificationTabletScreen(),
    );
  }
}
