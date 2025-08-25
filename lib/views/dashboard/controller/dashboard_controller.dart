import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../base/utils/basic_import.dart';
import '../../menu_section/profile/controller/profile_controller.dart';
import '../model/dashboard_info_model.dart';

class DashboardController extends GetxController {
  get onNotificationHistory => Routes.notificationScreen.toNamed;
  get onProfile => Routes.drawerMenuScreen.toNamed;
  get onTransactionHistory => Routes.transactionHistoryScreen.toNamed;
  get onAddMoney => Routes.addMoneyScreen.toNamed;

  final controller = Get.put(ProfileController());

  RxString availableBalance = ''.obs;
  RxInt setPinStatus = (-1).obs;

  @override
  void onInit() {
    getDashboardInfo();
    super.onInit();
  }

  // Get Dashboard Info
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late DashboardInfoModel _dashboardInfoModel;
  DashboardInfoModel get dashboardInfoModel => _dashboardInfoModel;

  Future<DashboardInfoModel?> getDashboardInfo() async {
    return RequestProcess().request<DashboardInfoModel>(
      fromJson: DashboardInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.dashboardInfo,
      isLoading: _isLoading,
      showErrorMessage: false,
      onSuccess: (value) {
        _dashboardInfoModel = value!;
        _getDashboardInfo();
      },
    );
  }

  void _getDashboardInfo() {
    var userWallet = _dashboardInfoModel.data.userWallet;
    availableBalance.value =
        userWallet.balance.toStringAsFixed(2) + ' ' + userWallet.currency;
    setPinStatus.value = _dashboardInfoModel.data.pinStatus;
  }
}
