import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../../base/api/model/common_success_model.dart';
import '../../../base/utils/basic_import.dart';
import '../model/strowallet/strowallet_card_info_model.dart';

class VirtualCardController extends GetxController {
  @override
  void onInit() {
    getStrowalletInfo();
    super.onInit();
  }

  final carouselController = CarouselSliderController();
  RxInt current = 0.obs;
  RxString strowalletCardId = ''.obs;
  RxBool selectedCardStatus = false.obs;

  // Strowallet Card Info Model
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late StrowalletCardInfoModel _strowalletCardInfoModel;
  StrowalletCardInfoModel get strowalletCardInfoModel =>
      _strowalletCardInfoModel;

  Future<StrowalletCardInfoModel?> getStrowalletInfo() async {
    return RequestProcess().request<StrowalletCardInfoModel>(
      fromJson: StrowalletCardInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCard,
      isLoading: _isLoading,
      onSuccess: (value) {
        _strowalletCardInfoModel = value!;
        if (_strowalletCardInfoModel.data.data.myCards.isNotEmpty) {
          var myCard = _strowalletCardInfoModel.data.data.myCards.first;
          strowalletCardId.value = myCard.cardId;
          selectedCardStatus.value = myCard.isDefault;
        }
      },
    );
  }

  // Make Remove Default
  final _isMakeDefaultLoading = false.obs;
  bool get isMakeDefaultLoading => _isMakeDefaultLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> makeDefault() async {
    Map<String, dynamic> inputBody = {
      'card_id': strowalletCardId.value,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardMakeRemoveDefault,
      isLoading: _isMakeDefaultLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        getStrowalletInfo();
      },
    );
  }
}

/*

strowalletCard - done 
strowalletCardCharges - done 
strowalletCardCreateInfo - done 
strowalletCardUpdateCustomerStatus - done 
strowalletCardCreateCustomer - done 
strowalletCardUpdateCustomer - done 
strowalletCardDetails - done 
strowalletCardBlock - done 
strowalletCardUnblock - done 
strowalletCardFund - done 
strowalletCardTransaction - done 
strowalletCardMakeRemoveDefault - done 

 */
