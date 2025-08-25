import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../controller/bank_statement_controller.dart';
import '../widget/bank_statement_log_widget.dart';

part 'bank_statement_mobile_screen.dart';
part 'bank_statement_tablet_screen.dart';

class BankStatementScreen extends GetView<BankStatementController> {
  const BankStatementScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BankStatementMobileScreen(),
      tablet: BankStatementTabletScreen(),
    );
  }
}
