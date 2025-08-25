import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../pin_setup/widget/check_pin_dialog.dart';
import '../controller/add_beneficiary_controller.dart';
import '../widget/beneficiary_input_widget.dart';

part 'add_beneficiary_mobile_screen.dart';
part 'add_beneficiary_tablet_screen.dart';

class AddBeneficiaryScreen extends GetView<AddBeneficiaryController> {
  const AddBeneficiaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: AddBeneficiaryMobileScreen(),
      tablet: AddBeneficiaryTabletScreen(),
    );
  }
}
