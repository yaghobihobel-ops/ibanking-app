import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/widgets/custom_switch.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../../../base/widgets/divider.dart';
import '../../../../../base/widgets/double_side_text_widget.dart';
import '../controller/strowallet_details_controller.dart';

part 'strowallet_details_mobile_screen.dart';
part 'strowallet_details_tablet_screen.dart';

class StrowalletDetailsScreen extends GetView<StrowalletDetailsController> {
  const StrowalletDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: StrowalletDetailsMobileScreen(),
      tablet: StrowalletDetailsTabletScreen(),
    );
  }
}
