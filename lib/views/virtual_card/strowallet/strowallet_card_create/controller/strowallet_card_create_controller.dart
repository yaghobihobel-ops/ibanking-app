import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/api/model/common_success_model.dart';
import '../../../../../base/utils/basic_import.dart';
import '../../../model/strowallet/strowallet_create_page_field_model.dart';
import '../../../model/strowallet/strowallet_fees_model.dart';
import '../widget/strowallet_customer_dynamic_input_field.dart';

class StrowalletCardCreateController extends GetxController {
  final amountController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
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

  // Dynamic Input Field
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  RxList inputFileFields = [].obs;
  RxBool hasFile = false.obs;
  RxString selectType = "".obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];

  // Update Customer KYC
  RxString idImage = ''.obs;
  RxString userPhoto = ''.obs;

  @override
  void onInit() {
    amountController.addListener(_updateFormValidity);
    customerStatusUpdate().then((v) =>
        getCustomerInputWithStatus().then((v) => getChargeInfoProcess()));

    super.onInit();
  }

  // Card Charge Info Process
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late StrowalletFeesModel _strowalletFeesModel;
  StrowalletFeesModel get strowalletFeesModel => _strowalletFeesModel;

  Future<StrowalletFeesModel?> getChargeInfoProcess() async {
    listImagePath.clear();
    listFieldName.clear();
    return RequestProcess().request<StrowalletFeesModel>(
      fromJson: StrowalletFeesModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardCharges,
      isLoading: _isLoading,
      onSuccess: (value) {
        _strowalletFeesModel = value!;
        var cardCharge = _strowalletFeesModel.data.data.cardCharge;
        var baseCurrency = _strowalletFeesModel.data.data.baseCurr;
        baseCurrencyRate.value = 1;
        fixedCharge.value = cardCharge.fixedCharge;
        percentCharge.value = cardCharge.percentCharge;
        minLimit.value = cardCharge.minLimit;
        maxLimit.value = cardCharge.maxLimit;
        baseCurrencyCode.value = baseCurrency;
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

  // Customer create field
  final _isFieldLoading = false.obs;
  bool get isFieldLoading => _isFieldLoading.value;

  late StrowalletCreatePageFieldModel _strowalletCreatePageFieldModel;
  StrowalletCreatePageFieldModel get strowalletCreatePageFieldModel =>
      _strowalletCreatePageFieldModel;

  Future<StrowalletCreatePageFieldModel?> getCustomerInputWithStatus() async {
    inputFieldControllers.clear();
    inputFields.clear();
    return RequestProcess().request<StrowalletCreatePageFieldModel>(
      fromJson: StrowalletCreatePageFieldModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardCreateInfo,
      isLoading: _isFieldLoading,
      onSuccess: (value) {
        _strowalletCreatePageFieldModel = value!;
        var data =
            _strowalletCreatePageFieldModel.data.data.customerCreateFields;

        getCustomerDynamicInputField(
          data: data,
          inputFieldControllers: inputFieldControllers,
          inputFields: inputFields,
          inputFileFields: inputFileFields,
          hasFile: hasFile,
          selectType: selectType,
        );
        final customerExist =
            _strowalletCreatePageFieldModel.data.data.customerExist;
        firstNameController.text = customerExist.firstName;
        lastNameController.text = customerExist.lastName;
        idImage.value = customerExist.idImage;
        userPhoto.value = customerExist.userPhoto;
      },
    );
  }

  // Buy card process
  final _isBuyLoading = false.obs;
  bool get isBuyLoading => _isBuyLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> buyCard() async {
    Map<String, dynamic> inputBody = {
      'name_on_card': cardHolderNameController.text,
      'card_amount': amountController.text,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletBuyCard,
      isLoading: _isBuyLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
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

  // CUSTOMER CREATE PROCESS - - - - - - - - - - - - - - -

  // Customer Create
  final _isCustomerCreateLoading = false.obs;
  bool get isCustomerCreateLoading => _isCustomerCreateLoading.value;

  late CommonSuccessModel _createCustomerModel;
  CommonSuccessModel get createCustomerModel => _createCustomerModel;

  Future<CommonSuccessModel?> customerCreateProcess() async {
    Map<String, dynamic> inputBody = {};
    var data = _strowalletCreatePageFieldModel.data.data.customerCreateFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].fieldName] = inputFieldControllers[i].text;
        print(inputFieldControllers[i].text);
      }
    }
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardCreateCustomer,
      isLoading: _isCustomerCreateLoading,
      method: HttpMethod.POST,
      fieldList: listFieldName,
      pathList: listImagePath,
      showSuccessMessage: true,
      showResult: true,
      body: inputBody,
      onSuccess: (value) {
        _createCustomerModel = value!;
      },
    );
  }

  ///
  final _isStatusLoading = false.obs;
  bool get isStatusLoading => _isStatusLoading.value;

  late CommonSuccessModel _statusUpdateModel;
  CommonSuccessModel get statusUpdateModel => _statusUpdateModel;

  Future<CommonSuccessModel?> customerStatusUpdate() async {
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardUpdateCustomerStatus,
      isLoading: _isStatusLoading,
      onSuccess: (value) {
        _statusUpdateModel = value!;
      },
    );
  }

  // update customer kyc
  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;

  Future<CommonSuccessModel?> updateCustomerKyc() async {
    Map<String, dynamic> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.strowalletCardUpdateCustomer,
      isLoading: _isConfirmLoading,
      method: HttpMethod.POST,
      body: inputBody,
      fieldList: listFieldName,
      pathList: listImagePath,
      showSuccessMessage: true,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        listImagePath.clear();
        listFieldName.clear();
      },
    );
  }
}
