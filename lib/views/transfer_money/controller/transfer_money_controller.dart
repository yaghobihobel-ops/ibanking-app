import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../base/api/model/common_success_model.dart';
import '../../../base/utils/basic_import.dart';
import '../../congratulations/model/congratulations_model.dart';
import '../../congratulations/screen/congratulations_screen.dart';
import '../../saved_beneficiary/beneficiary/controller/beneficiary_controller.dart';
import '../model/select_beneficiary.dart';
import '../model/transfer_money_charge_info_model.dart';
import '../model/transfrer_money_preview_model.dart';

class TransferMoneyController extends GetxController {
  final amountController = TextEditingController();
  final remarkController = TextEditingController();
  RxBool isFormValid = false.obs;
  RxBool isAvailableChargeInfo = false.obs;

  RxString baseCurrencyCode = ''.obs;
  RxDouble baseCurrencyRate = 0.0.obs;
  RxDouble availableBalance = 0.0.obs;
  RxDouble totalFee = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble minLimit = 0.0.obs;
  RxDouble maxLimit = 0.0.obs;
  RxString baseCurrencyImage = ''.obs;
  RxString receiverImage = ''.obs;
  RxDouble amount = 0.0.obs;

  RxInt selectedBeneficiaryId = 0.obs;

  //
  RxString beneficiaryAccountNumber = ''.obs;
  RxString beneficiaryAccountHolderName = Strings.searchBeneficiary.obs;
  RxString identifier = ''.obs;

  final controller = Get.put(BeneficiaryController());
  @override
  void onInit() {
    controller.getBeneficiaryInfo();
    amount.listen((_) {
      _updateFormValidity();
    });
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = amount.value > 0 &&
        beneficiaryAccountHolderName.value != Strings.searchBeneficiary &&
        isAvailableChargeInfo.value;
  }

  // Select Beneficiary Process
  final _isSelectBeneficiaryLoading = false.obs;
  bool get isSelectBeneficiaryLoading => _isSelectBeneficiaryLoading.value;

  late SelectBeneficiaryModel _selectBeneficiaryModel;
  SelectBeneficiaryModel get selectBeneficiaryModel => _selectBeneficiaryModel;

  Future<SelectBeneficiaryModel?> selectBeneficiaryProcess(
      int beneficiaryId) async {
    Map<String, dynamic> inputBody = {
      'beneficiary_id': beneficiaryId,
    };

    return RequestProcess().request<SelectBeneficiaryModel>(
      fromJson: SelectBeneficiaryModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiarySelect,
      isLoading: _isSelectBeneficiaryLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _selectBeneficiaryModel = value!;

        var beneficiary =
            _selectBeneficiaryModel.data.tempData.data.beneficiary;
        beneficiaryAccountNumber.value = beneficiary.accountNumber;
        beneficiaryAccountHolderName.value = beneficiary.accountHolderName;
        identifier.value = _selectBeneficiaryModel.data.tempData.identifier;
        transferMoneyCharge();
      },
    );
  }

  // Select Charge Info
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late TransferMoneyChargeInfoModel _transferMoneyChargeInfoModel;
  TransferMoneyChargeInfoModel get transferMoneyChargeInfoModel =>
      _transferMoneyChargeInfoModel;

  Future<TransferMoneyChargeInfoModel?> transferMoneyCharge() async {
    Map<String, dynamic> inputBody = {
      'identifier': identifier.value,
    };
    return RequestProcess().request<TransferMoneyChargeInfoModel>(
      fromJson: TransferMoneyChargeInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.chargeInfo,
      isLoading: _isLoading,
      body: inputBody,
      method: HttpMethod.POST,
      onSuccess: (value) {
        _transferMoneyChargeInfoModel = value!;
        isAvailableChargeInfo.value = true;
        _setDataFromTransferMoneyInfo();
      },
    );
  }

  void _setDataFromTransferMoneyInfo() {
    var feesAndCharges = _transferMoneyChargeInfoModel.data.feesAndCharges;
    baseCurrencyCode.value = feesAndCharges.currency;
    baseCurrencyRate.value = feesAndCharges.rate;
    fixedCharge.value = feesAndCharges.fixedCharge;
    percentCharge.value = feesAndCharges.percentCharge;
    minLimit.value = feesAndCharges.minLimit;
    maxLimit.value = feesAndCharges.maxLimit;
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

  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late TransferMoneyPreviewModel _transferMoneyPreviewModel;
  TransferMoneyPreviewModel get transferMoneyPreviewModel =>
      _transferMoneyPreviewModel;

  Future<TransferMoneyPreviewModel?> moneyTransferSubmitProcess() async {
    Map<String, dynamic> inputBody = {
      'identifier': identifier.value,
      'amount': amountController.text,
      'remarks': remarkController.text,
    };

    return RequestProcess().request<TransferMoneyPreviewModel>(
      fromJson: TransferMoneyPreviewModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyTransferSubmit,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _transferMoneyPreviewModel = value!;
        Get.toNamed(Routes.transferMoneyPreview);
      },
    );
  }

  // Transfer Money Confirm
  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> transferMoneyConfirm() async {
    Map<String, dynamic> inputBody = {
      'identifier': identifier.value,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.moneyTransferConfirm,
      isLoading: _isConfirmLoading,
      method: HttpMethod.POST,
      showSuccessMessage: false,
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
      type: Strings.moneyTransfer,
    );

    Get.to(
      () => CongratulationsScreen(),
      arguments: congratulation,
    );
  }
}
