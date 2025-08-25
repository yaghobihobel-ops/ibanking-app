import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../controller/strowallet_card_transaction_controller.dart';
import '../widget/card_transaction_widget.dart';

part 'strowallet_card_transaction_mobile_screen.dart';
part 'strowallet_card_transaction_tablet_screen.dart';

class StrowalletCardTransactionScreen
    extends GetView<StrowalletCardTransactionController> {
  const StrowalletCardTransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: StrowalletCardTransactionMobileScreen(),
      tablet: StrowalletCardTransactionTabletScreen(),
    );
  }
}
