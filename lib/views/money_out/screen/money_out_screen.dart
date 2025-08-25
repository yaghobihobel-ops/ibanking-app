import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/api/services/check_kyc.dart';
import '../../../base/utils/basic_import.dart';
import '../../pin_setup/widget/check_pin_dialog.dart';
import '../controller/money_out_controller.dart';
import '../widget/money_out_amount_widget.dart';
import '../widget/money_out_payment_gateway.dart';

part 'money_out_mobile_screen.dart';
part 'money_out_tablet_screen.dart';

class MoneyOutScreen extends GetView<MoneyOutController> {
  const MoneyOutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MoneyOutMobileScreen(),
      tablet: MoneyOutTabletScreen(),
    );
  }
}
