import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../controller/strowallet_add_fund_controller.dart';
import '../widget/strowallet_card_fund_charge_screen.dart';
import '../widget/strowallet_card_fund_input_widget.dart';

part 'strowallet_add_fund_mobile_screen.dart';
part 'strowallet_add_fund_tablet_screen.dart';

class StrowalletAddFundScreen extends GetView<StrowalletAddFundController> {
  const StrowalletAddFundScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: StrowalletAddFundMobileScreen(),
      tablet: StrowalletAddFundTabletScreen(),
    );
  }
}
