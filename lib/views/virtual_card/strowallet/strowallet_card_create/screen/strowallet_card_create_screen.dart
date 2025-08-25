import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../../../routes/routes.dart';
import '../controller/strowallet_card_create_controller.dart';
import '../widget/strowallet_card_create_input_widget.dart';
import '../widget/strowallet_card_create_preview.dart';

part 'strowallet_card_create_mobile_screen.dart';
part 'strowallet_card_create_tablet_screen.dart';

class StrowalletCardCreateScreen
    extends GetView<StrowalletCardCreateController> {
  const StrowalletCardCreateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: StrowalletCardCreateMobileScreen(),
      tablet: StrowalletCardCreateTabletScreen(),
    );
  }
}
