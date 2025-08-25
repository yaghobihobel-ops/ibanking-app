import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/kyc_information_controller.dart';
import '../widget/kyc_heading.dart';
import '../widget/kyc_input_widget.dart';

part 'kyc_information_mobile_screen.dart';
part 'kyc_information_tablet_screen.dart';

class KycInformationScreen extends GetView<KycInformationController> {
  const KycInformationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: KycInformationMobileScreen(),
      tablet: KycInformationTabletScreen(),
    );
  }
}
