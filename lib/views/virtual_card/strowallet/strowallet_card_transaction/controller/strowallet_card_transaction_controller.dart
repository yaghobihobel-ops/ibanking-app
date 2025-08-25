import 'package:get/get.dart';
import 'package:ibanking/views/virtual_card/controller/virtual_card_controller.dart';

import '../../../../../base/utils/basic_import.dart';
import '../../../model/strowallet/strowallet_card_transaction_model.dart';

class StrowalletCardTransactionController extends GetxController {
  final controller = Get.put(VirtualCardController());

  @override
  void onInit() {
    getCardTransaction();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late StrowalletCardTransactionModel _strowalletCardTransactionModel;
  StrowalletCardTransactionModel get strowalletCardTransactionModel =>
      _strowalletCardTransactionModel;

  Future<StrowalletCardTransactionModel?> getCardTransaction() async {
    return RequestProcess().request<StrowalletCardTransactionModel>(
      fromJson: StrowalletCardTransactionModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardTransaction,
      isLoading: _isLoading,
      queryParams: {'card_id': controller.strowalletCardId.value},
      onSuccess: (value) {
        _strowalletCardTransactionModel = value!;
      },
    );
  }
}
