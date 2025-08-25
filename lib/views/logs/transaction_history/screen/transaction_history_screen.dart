import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibanking/assets/assets.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/transaction_history_controller.dart';
import '../widget/transaction_history_widget.dart';

part 'transaction_history_mobile_screen.dart';
part 'transaction_history_tablet_screen.dart';

class TransactionHistoryScreen extends GetView<TransactionHistoryController> {
  const TransactionHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: TransactionHistoryMobileScreen(),
      tablet: TransactionHistoryTabletScreen(),
    );
  }
}
