import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';
import 'package:ibanking/views/saved_beneficiary/beneficiary/widget/beneficiary_list_widget.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/beneficiary_controller.dart';
import '../widget/beneficiary_search_widget.dart';

part 'beneficiary_mobile_screen.dart';
part 'beneficiary_tablet_screen.dart';

class BeneficiaryScreen extends GetView<BeneficiaryController> {
  const BeneficiaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BeneficiaryMobileScreen(),
      tablet: BeneficiaryTabletScreen(),
    );
  }
}
