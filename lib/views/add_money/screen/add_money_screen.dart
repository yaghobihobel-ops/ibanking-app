import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/api/services/check_kyc.dart';
import '../../../base/utils/basic_import.dart';
import '../../pin_setup/widget/check_pin_dialog.dart';
import '../controller/add_money_controller.dart';
import '../widget/amount_with_receipt.dart';
import '../widget/payment_gateway_with_preview.dart';

part 'add_money_mobile_screen.dart';
part 'add_money_tablet_screen.dart';

class AddMoneyScreen extends GetView<AddMoneyController> {
  const AddMoneyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: AddMoneyMobileScreen(),
      tablet: AddMoneyTabletScreen(),
    );
  }
}
