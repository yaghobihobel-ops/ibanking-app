import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/api/model/common_success_model.dart';
import '../../../../../base/utils/basic_import.dart';
import '../../../controller/virtual_card_controller.dart';
import '../../../model/strowallet/strowallet_fees_model.dart';

class StrowalletAddFundController extends GetxController {
  final amountController = TextEditingController();
  RxString baseCurrencyImage = ''.obs;
  RxString baseCurrencyCode = ''.obs;
  RxDouble availableBalance = 0.0.obs;
  RxDouble totalFee = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble minLimit = 0.0.obs;
  RxDouble maxLimit = 0.0.obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble baseCurrencyRate = 0.0.obs;
  RxBool isFormValid = false.obs;
  final controller = Get.put(VirtualCardController());

  @override
  void onInit() {
    amountController.addListener(_updateFormValidity);
    getChargeInfoProcess();
    super.onInit();
  }

  // Route
  get onCardFund => addCardFund();

  // Card Charge Info Process
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late StrowalletFeesModel _strowalletFeesModel;
  StrowalletFeesModel get strowalletFeesModel => _strowalletFeesModel;

  Future<StrowalletFeesModel?> getChargeInfoProcess() async {
    return RequestProcess().request<StrowalletFeesModel>(
      fromJson: StrowalletFeesModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardCharges,
      isLoading: _isLoading,
      onSuccess: (value) {
        _strowalletFeesModel = value!;
        var cardCharge = _strowalletFeesModel.data.data.cardCharge;
        baseCurrencyRate.value = 1;
        fixedCharge.value = cardCharge.fixedCharge;
        percentCharge.value = cardCharge.percentCharge;
        minLimit.value = cardCharge.minLimit;
        maxLimit.value = cardCharge.maxLimit;
        baseCurrencyCode.value = _strowalletFeesModel.data.data.baseCurr;
      },
    );
  }

  RxDouble getFee() {
    double value = fixedCharge.value;
    double amount = double.parse(
        amountController.text.isEmpty ? '0.0' : amountController.text);
    value = value + (amount * (percentCharge.value / 100));

    if (amountController.text.isEmpty) {
      totalFee.value = 0.0;
    } else {
      totalFee.value = value;
      totalAmount.value = (amount + totalFee.value) * baseCurrencyRate.value;
    }

    return totalFee;
  }

  void _updateFormValidity() {
    isFormValid.value = amountController.text.isNotEmpty;
  }

  final _isFundLoading = false.obs;
  bool get isFundLoading => _isFundLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> addCardFund() async {
    Map<String, dynamic> inputBody = {
      'card_id': controller.strowalletCardId.value,
      'fund_amount': amountController.text,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardFund,
      isLoading: _isFundLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
      },
    );
  }
}
