import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../pin_setup/widget/check_pin_dialog.dart';
import '../controller/transfer_money_controller.dart';
import '../widget/amount_with_receiver_info.dart';
import '../widget/payment_charge_screen.dart';
import '../widget/select_beneficiary.dart';

part 'transfer_money_mobile_screen.dart';
part 'transfer_money_tablet_screen.dart';

class TransferMoneyScreen extends GetView<TransferMoneyController> {
  const TransferMoneyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: TransferMoneyMobileScreen(),
      tablet: TransferMoneyTabletScreen(),
    );
  }
}
