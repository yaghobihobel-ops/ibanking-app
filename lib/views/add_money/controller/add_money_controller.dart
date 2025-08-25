import 'package:ibanking/models/add_money_gateway_model.dart';
import 'package:ibanking/models/manual_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/add_money/widget/web_payment_screen.dart';

import '../../../base/api/model/common_success_model.dart';
import '../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../congratulations/model/congratulations_model.dart';
import '../../congratulations/screen/congratulations_screen.dart';
import '../model /add_money_gateway_model.dart';
import '../model /add_money_info_model.dart';
import '../model /manual_input_model.dart';
import '../widget/manual_dynamic_input_field.dart';

class AddMoneyController extends GetxController {
  Rxn<Currency> selectPaymentGateway = Rxn<Currency>();
  final List<Currency> paymentGatewayList = [];
  RxDouble exchangeRate = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble totalFee = 0.0.obs;
  RxDouble totalAmount = 0.0.obs;
  RxString exchangeRateText = ''.obs;
  RxString limitText = ''.obs;
  RxString chargeText = ''.obs;
  RxDouble minLimit = 0.0.obs;
  RxDouble maxLimit = 0.0.obs;
  RxString baseCurrency = ''.obs;
  RxString baseCurrencyImage = ''.obs;
  RxDouble availableBalance = 0.0.obs;
  RxDouble baseCurrencyRate = 0.0.obs;
  RxString gatewayImage = ''.obs;

  // Image path
  RxString baseUrl = ''.obs;
  RxString pathLocation = ''.obs;
  RxString defaultImage = ''.obs;
  RxBool isFormValid = false.obs;

  // Dynamic Input Field
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  RxList inputFileFields = [].obs;
  RxBool hasFile = false.obs;
  RxString selectType = "".obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];
  @override
  void onInit() {
    amountController.addListener(_updateFormValidity);
    getAddMoneyInfo();
    super.onInit();
  }

  final amountController = TextEditingController();

  RxString selectGateway = ''.obs;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late AddMoneyInfoModel _addMoneyInfoModel;
  AddMoneyInfoModel get addMoneyInfoModel => _addMoneyInfoModel;

  Future<AddMoneyInfoModel?> getAddMoneyInfo() async {
    return RequestProcess().request<AddMoneyInfoModel>(
      fromJson: AddMoneyInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.addMoneyInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _addMoneyInfoModel = value!;
        _setGatewayInfo();
        updateExchangeRateWithLimit();
      },
    );
  }

  updateExchangeRateWithLimit() {
    var gateway = selectPaymentGateway.value!;
    exchangeRate.value = baseCurrencyRate.value * gateway.rate;
    minLimit.value = gateway.minLimit / exchangeRate.value;
    maxLimit.value = gateway.maxLimit / exchangeRate.value;

    exchangeRateText.value =
        '1 ${baseCurrency.value} - ${exchangeRate.value.toStringAsFixed(4)} ${selectPaymentGateway.value!.currencyCode} ';
    limitText.value =
        '${minLimit.value.toStringAsFixed(4)} - ${maxLimit.value.toStringAsFixed(4)}  ${baseCurrency.value}';
    chargeText.value =
        '${fixedCharge.value.toStringAsFixed(4)} ${baseCurrency.value} + ${percentCharge.value.toStringAsFixed(0)}%';

    if (selectPaymentGateway.value!.image != '') {
      gatewayImage.value =
          '${baseUrl.value}/${pathLocation.value}/${selectPaymentGateway.value!.image}';
    } else {
      gatewayImage.value = '${baseUrl.value}/${defaultImage.value}';
    }
  }

  // Set gateway information and update the available balance
  _setGatewayInfo() {
    var wallet = _addMoneyInfoModel.data.userWallet;
    baseCurrency.value = wallet.currency;
    availableBalance.value = wallet.balance;
    baseCurrencyRate.value = wallet.rate;

    var paymentGateways =
        _addMoneyInfoModel.data.paymentGateways.first.currencies.first;
    selectPaymentGateway.value =
        _addMoneyInfoModel.data.paymentGateways.first.currencies.first;
    minLimit.value = paymentGateways.minLimit;
    maxLimit.value = paymentGateways.maxLimit;
    fixedCharge.value = paymentGateways.fixedCharge;
    percentCharge.value = paymentGateways.percentCharge;

    // Update the payment gateway list when the API response is received.
    _addMoneyInfoModel.data.paymentGateways.forEach(
      (gateway) {
        gateway.currencies.forEach((currency) {
          paymentGatewayList.add(Currency(
            id: currency.id,
            paymentGatewayId: currency.paymentGatewayId,
            name: currency.name,
            alias: currency.alias,
            currencyCode: currency.currencyCode,
            currencySymbol: currency.currencySymbol,
            image: currency.image,
            minLimit: currency.minLimit,
            maxLimit: currency.maxLimit,
            percentCharge: currency.percentCharge,
            fixedCharge: currency.fixedCharge,
            rate: currency.rate,
          ));
        });
      },
    );
  }

  RxDouble getFee({required double rate}) {
    double value = fixedCharge.value * rate;
    double amount = double.parse(
        amountController.text.isEmpty ? '0.0' : amountController.text);
    value = value + (amount * (percentCharge.value / 100));

    if (amountController.text.isEmpty) {
      totalFee.value = 0.0;
    } else {
      totalFee.value = value;
      totalAmount.value =
          (amount + totalFee.value) * selectPaymentGateway.value!.rate;
    }

    return totalFee;
  }

  void _updateFormValidity() {
    isFormValid.value = amountController.text.isNotEmpty;
  }

  // Add Money Confirm
  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;

  late AddMoneyGatewayModel _addMoneyGatewayModel;
  AddMoneyGatewayModel get addMoneyGatewayModel => _addMoneyGatewayModel;

  Future<AddMoneyGatewayModel?> addMoneyAutomaticConfirm() async {
    Map<String, dynamic> inputBody = {
      'amount': amountController.text,
      'currency': selectPaymentGateway.value!.alias,
    };

    return RequestProcess().request<AddMoneyGatewayModel>(
      fromJson: AddMoneyGatewayModel.fromJson,
      apiEndpoint: ApiEndpoint.addMoneyConfirm,
      isLoading: _isConfirmLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _addMoneyGatewayModel = value!;
        Get.to(() => WebPaymentScreen());
      },
    );
  }

  late ManualInputModel _manualInputModel;
  ManualInputModel get manualInputModel => _manualInputModel;

  Future<ManualInputModel?> addMoneyManualInsert() async {
    inputFileFields.clear();
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();

    return RequestProcess().request<ManualInputModel>(
      fromJson: ManualInputModel.fromJson,
      apiEndpoint: ApiEndpoint.addMoneyManualInput,
      isLoading: _isConfirmLoading,
      showSuccessMessage: false,
      queryParams: {
        'alias': selectPaymentGateway.value!.alias,
      },
      onSuccess: (value) {
        _manualInputModel = value!;
        var data = _manualInputModel.data.inputFields;
        getManualDynamicInputField(
          data: data,
          inputFieldControllers: inputFieldControllers,
          inputFields: inputFields,
          inputFileFields: inputFileFields,
          hasFile: hasFile,
          selectType: selectType,
        );
        Get.toNamed(Routes.addMoneyManualFieldWidget);
      },
    );
  }

  // Add Money Manual Confirm
  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> addMoneyManualConfirm() async {
    Map<String, String> inputBody = {
      'currency': selectPaymentGateway.value!.alias,
      'amount': amountController.text,
    };
    final data = _manualInputModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.addMoneyManualConfirm,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      fieldList: listFieldName,
      pathList: listImagePath,
      onSuccess: (value) {
        inputFields.clear();
        listImagePath.clear();
        listFieldName.clear();
        inputFieldControllers.clear();
        _commonSuccessModel = value!;
        _confirmation(_commonSuccessModel);
      },
    );
  }

  updateImageData(String fieldName, String imagePath) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      listImagePath[itemIndex] = imagePath;
    } else {
      listFieldName.add(fieldName);
      listImagePath.add(imagePath);
    }
    update();
  }

  String? getImagePath(String fieldName) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      return listImagePath[itemIndex];
    }
    return null;
  }

  void _confirmation(CommonSuccessModel commonSuccessModel) {
    Congratulation congratulation = Congratulation(
      details: commonSuccessModel.message.success.first,
      route: Routes.navigation,
      buttonText: Strings.backToHome,
      type: Strings.addMoney,
    );

    Get.to(
      () => CongratulationsScreen(),
      arguments: congratulation,
    );
  }
}
