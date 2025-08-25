import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../base/api/model/common_success_model.dart';
import '../../../base/utils/basic_import.dart';
import '../../congratulations/model/congratulations_model.dart';
import '../../congratulations/screen/congratulations_screen.dart';
import '../model/instruction_confirm_model.dart';
import '../model/instruction_model.dart';
import '../model/money_out_info_model.dart';
import '../model/money_out_submit_model.dart';
import '../widget/money_out_dynamic_input_field.dart';

class MoneyOutController extends GetxController {
  final amountController = TextEditingController();
  RxString baseCurrency = ''.obs;
  RxString baseCurrencyImage = ''.obs;
  RxDouble baseCurrencyRate = 0.0.obs;
  RxBool isFormValid = false.obs;
  RxDouble totalFee = 0.0.obs;
  RxDouble totalAmount = 0.0.obs;
  RxString exchangeRateText = ''.obs;
  RxString limitText = ''.obs;
  RxString chargeText = ''.obs;
  RxDouble minLimit = 0.0.obs;
  RxDouble maxLimit = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble exchangeRate = 0.0.obs;

  Rxn<PaymentGateway> selectPaymentGateway = Rxn<PaymentGateway>();
  final List<PaymentGateway> paymentGatewayList = [];
  RxString gatewayImage = ''.obs;

  // Dynamic Input Field
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  RxList inputFileFields = [].obs;
  RxBool hasFile = false.obs;
  RxString selectType = "".obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];

  //
  get onMoneyOut => moneyOutInsert();

  @override
  void onInit() {
    amountController.addListener(_updateFormValidity);
    getMoneyOutInfo();
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = amountController.text.isNotEmpty;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MoneyOutInfo _moneyOutInfo;
  MoneyOutInfo get moneyOutInfo => _moneyOutInfo;

  Future<MoneyOutInfo?> getMoneyOutInfo() async {
    return RequestProcess().request<MoneyOutInfo>(
      fromJson: MoneyOutInfo.fromJson,
      apiEndpoint: ApiEndpoint.moneyOutInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _moneyOutInfo = value!;
        selectPaymentGateway.value = _moneyOutInfo.data.paymentGateways.first;
        baseCurrency.value = _moneyOutInfo.data.userWallet.currency;
        _moneyOutInfo.data.paymentGateways.forEach(
          (v) {
            paymentGatewayList.add(
              PaymentGateway(
                name: v.name,
                alias: v.alias,
                minLimit: v.minLimit,
                maxLimit: v.maxLimit,
                fixedCharge: v.fixedCharge,
                percentCharge: v.percentCharge,
                rate: v.rate,
                gatewayCurrency: v.gatewayCurrency,
              ),
            );
          },
        );
        _setGatewayInfo();
        updateExchangeRateWithLimit();
      },
    );
  }

  _setGatewayInfo() {
    var wallet = _moneyOutInfo.data.userWallet;
    baseCurrency.value = wallet.currency;
    baseCurrencyRate.value = wallet.rate;

    var paymentGateways = _moneyOutInfo.data.paymentGateways.first;
    selectPaymentGateway.value = _moneyOutInfo.data.paymentGateways.first;
    minLimit.value = paymentGateways.minLimit;
    maxLimit.value = paymentGateways.maxLimit;
    fixedCharge.value = paymentGateways.fixedCharge;
    percentCharge.value = paymentGateways.percentCharge;
  }

  updateExchangeRateWithLimit() {
    var gateway = selectPaymentGateway.value!;
    exchangeRate.value = baseCurrencyRate.value * gateway.rate;
    minLimit.value = gateway.minLimit / exchangeRate.value;
    maxLimit.value = gateway.maxLimit / exchangeRate.value;

    exchangeRateText.value =
        '1 ${baseCurrency.value} - ${exchangeRate.value.toStringAsFixed(2)} ${selectPaymentGateway.value!.gatewayCurrency} ';
    limitText.value =
        '${minLimit.value.toStringAsFixed(4)} ${baseCurrency.value} - ${maxLimit.value.toStringAsFixed(4)}  ${baseCurrency.value}';
    chargeText.value =
        '${fixedCharge.value.toStringAsFixed(4)} ${baseCurrency.value} + ${percentCharge.value.toStringAsFixed(0)}%';
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

  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late MoneyOutSubmitModel _moneyOutSubmitModel;
  MoneyOutSubmitModel get moneyOutSubmitModel => _moneyOutSubmitModel;

  Future<MoneyOutSubmitModel?> moneyOutInsert() async {
    Map<String, dynamic> inputBody = {
      'payment_gateway': selectPaymentGateway.value!.alias,
      'amount': amountController.text,
    };

    return RequestProcess().request<MoneyOutSubmitModel>(
      fromJson: MoneyOutSubmitModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyOutSubmit,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _moneyOutSubmitModel = value!;
        instructionsInfoProcess();
      },
    );
  }

  final _isInstructionsLoading = false.obs;
  bool get isInstructionsLoading => _isInstructionsLoading.value;

  late InstructionModel _instructionModel;
  InstructionModel get instructionModel => _instructionModel;

  Future<InstructionModel?> instructionsInfoProcess() async {
    inputFieldControllers.clear();
    inputFields.clear();
    inputFileFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    Map<String, dynamic> inputBody = {
      'token': _moneyOutSubmitModel.data.tempData.identifier,
    };

    return RequestProcess().request<InstructionModel>(
      fromJson: InstructionModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyOutInstruction,
      isLoading: _isInstructionsLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _instructionModel = value!;

        var data = _instructionModel.data.inputFields;
        moneyOutDynamicInputField(
          data: data,
          inputFieldControllers: inputFieldControllers,
          inputFields: inputFields,
          inputFileFields: inputFileFields,
          hasFile: hasFile,
          selectType: selectType,
        );
        Get.toNamed(Routes.instructionsFieldWidget);
      },
    );
  }

  final _isInstructionsConfirmLoading = false.obs;
  bool get isInstructionsConfirmLoading => _isInstructionsConfirmLoading.value;

  late InstructionConfirmModel _instructionConfirmModel;
  InstructionConfirmModel get instructionConfirmModel =>
      _instructionConfirmModel;

  Future<InstructionConfirmModel?> instructionsSubmit() async {
    Map<String, String> inputBody = {
      'token': _moneyOutSubmitModel.data.tempData.identifier,
    };
    final data = _instructionModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }
    return RequestProcess().request<InstructionConfirmModel>(
      fromJson: InstructionConfirmModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyOutInstructionSubmit,
      isLoading: _isInstructionsConfirmLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _instructionConfirmModel = value!;
        Get.toNamed(Routes.moneyOutPreview);
      },
    );
  }

  final _isMoneyOutLoading = false.obs;
  bool get isMoneyOutLoading => _isMoneyOutLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> moneyOutConfirm() async {
    Map<String, String> inputBody = {
      'token': _moneyOutSubmitModel.data.tempData.identifier,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyOutConfirm,
      isLoading: _isMoneyOutLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        _confirmation(_commonSuccessModel);
      },
    );
  }

  void _confirmation(CommonSuccessModel commonSuccessModel) {
    Congratulation congratulation = Congratulation(
      details: commonSuccessModel.message.success.first,
      route: Routes.navigation,
      buttonText: Strings.backToHome,
      type: Strings.moneyOut,
    );

    Get.to(
      () => CongratulationsScreen(),
      arguments: congratulation,
    );
  }
}
