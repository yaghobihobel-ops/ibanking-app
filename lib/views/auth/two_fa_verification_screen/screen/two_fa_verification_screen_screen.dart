import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/two_fa_verification_screen_controller.dart';
import '../widget/otp_submit_button.dart';
import '../widget/two_fa_otp_headline.dart';
import '../widget/two_fa_otp_input.dart';

part 'two_fa_verification_screen_mobile_screen.dart';
part 'two_fa_verification_screen_tablet_screen.dart';

class TwoFaVerificationScreenScreen
    extends GetView<TwoFaVerificationScreenController> {
  const TwoFaVerificationScreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: TwoFaVerificationScreenMobileScreen(),
      tablet: TwoFaVerificationScreenTabletScreen(),
    );
  }
}
