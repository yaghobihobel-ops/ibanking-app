import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/screen/dashboard_screen.dart';
import '../../logs/transaction_history/screen/transaction_history_screen.dart';
import '../../saved_beneficiary/beneficiary/screen/beneficiary_screen.dart';
import '../../virtual_card/screen/virtual_card_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> bodyPages = [
    const DashboardScreen(),
    const BeneficiaryScreen(),
    const VirtualCardScreen(),
    const TransactionHistoryScreen(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
