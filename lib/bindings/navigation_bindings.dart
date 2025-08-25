import 'package:get/get.dart';
import 'package:ibanking/views/saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';

import '../views/auth/kyc_information/controller/kyc_information_controller.dart';
import '../views/dashboard/controller/dashboard_controller.dart';
import '../views/logs/transaction_history/controller/transaction_history_controller.dart';
import '../views/menu_section/profile/controller/profile_controller.dart';
import '../views/virtual_card/controller/virtual_card_controller.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => BeneficiaryController());
    Get.lazyPut(() => VirtualCardController());
    Get.lazyPut(() => TransactionHistoryController());
    Get.lazyPut(() => KycInformationController());
  }
}
