import 'package:get/get.dart';
import 'package:ibanking/views/virtual_card/controller/virtual_card_controller.dart';

import '../../../../../base/api/model/common_success_model.dart';
import '../../../../../base/utils/basic_import.dart';
import '../../../model/strowallet/strowallet_card_details_model.dart';

class StrowalletDetailsController extends GetxController {
  @override
  void onInit() {
    getCardDetailsInfo();
    super.onInit();
  }

  RxBool status = false.obs;

  // Get Card ID
  final controller = Get.put(VirtualCardController());

  // Strowallet Card Details
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late StrowalletCardDetailsModel _strowalletCardDetailsModel;
  StrowalletCardDetailsModel get strowalletCardDetailsModel =>
      _strowalletCardDetailsModel;

  Future<StrowalletCardDetailsModel?> getCardDetailsInfo() async {
    return RequestProcess().request<StrowalletCardDetailsModel>(
      fromJson: StrowalletCardDetailsModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardDetails,
      isLoading: _isLoading,
      queryParams: {'card_id': controller.strowalletCardId.value},
      onSuccess: (value) {
        _strowalletCardDetailsModel = value!;
      },
    );
  }

  // Card freezed
  final _isFreezedLoading = false.obs;
  bool get isFreezedLoading => _isFreezedLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> cardFreezed() async {
    Map<String, dynamic> inputBody = {
      'card_id': controller.strowalletCardId.value,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardBlock,
      isLoading: _isFreezedLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        getCardDetailsInfo();
      },
    );
  }

  // Card freezed
  Future<CommonSuccessModel?> cardUnfreeze() async {
    Map<String, dynamic> inputBody = {
      'card_id': controller.strowalletCardId.value,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardUnblock,
      isLoading: _isFreezedLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        getCardDetailsInfo();
      },
    );
  }
}
