import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../auth/kyc_information/controller/kyc_information_controller.dart';
import '../controller/virtual_card_controller.dart';
import '../widget/kyc/kyc_status.dart';
import '../widget/strowallet/strowallet_slider.dart';

part 'virtual_card_mobile_screen.dart';
part 'virtual_card_tablet_screen.dart';

class VirtualCardScreen extends GetView<VirtualCardController> {
  const VirtualCardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: VirtualCardMobileScreen(),
      tablet: VirtualCardTabletScreen(),
    );
  }
}
