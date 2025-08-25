import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../auth/kyc_information/controller/kyc_information_controller.dart';
import '../../saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';
import '../controller/dashboard_controller.dart';
import '../widget/feature_section.dart';
import '../widget/kyc_status_widget.dart';
import '../widget/latest_payments.dart';
import '../widget/quick_send.dart';
import '../widget/top_bar.dart';

part 'dashboard_mobile_screen.dart';
part 'dashboard_tablet_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DashboardMobileScreen(),
      tablet: DashboardTabletScreen(),
    );
  }
}
