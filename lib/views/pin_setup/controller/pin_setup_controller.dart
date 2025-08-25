import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/dashboard/controller/dashboard_controller.dart';

import '../../../base/api/model/common_success_model.dart';
import '../../../base/utils/basic_import.dart';

class PinSetupController extends GetxController {
  final pinCodeController = TextEditingController();
  final oldPinCodeController = TextEditingController();
  final newPinCodeController = TextEditingController();
  final checkPinController = TextEditingController();
  final controller = Get.put(DashboardController());
  RxBool isFormValid = false.obs;
  final isPinMatched = false.obs;
  final pinStatus = ''.obs;
  @override
  void onInit() {
    pinCodeController.addListener(_updateFormValidity);
    oldPinCodeController.addListener(_updateFormValidity);
    newPinCodeController.addListener(_updateFormValidity);
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = controller.setPinStatus.value == 0
        ? pinCodeController.text.isNotEmpty
        : (oldPinCodeController.text.isNotEmpty &&
            newPinCodeController.text.isNotEmpty);
  }

  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> storePin() async {
    Map<String, dynamic> inputBody = {
      'pin_code': pinCodeController.text,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.setupPinStore,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      showSuccessMessage: true,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        controller.getDashboardInfo();
        _clearInputField();
      },
    );
  }

  // Update Setup Pin
  Future<CommonSuccessModel?> updateSetupPin() async {
    Map<String, dynamic> inputBody = {
      'old_pin': oldPinCodeController.text,
      'new_pin': newPinCodeController.text,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.setupPinUpdate,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      showSuccessMessage: true,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        controller.getDashboardInfo();
        _clearInputField();
      },
    );
  }

  // Pin Check
  Future<CommonSuccessModel?> pinCheck(String value) async {
    Map<String, dynamic> inputBody = {
      'pin': value,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.pinCheck,
      isLoading: _isSubmitLoading,
      method: HttpMethod.POST,
      body: inputBody,
      showErrorMessage: true,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        isPinMatched.value = true;
        pinStatus.value = Strings.pinMatchedSuccessfully;
      },
      onError: (e) {
        isPinMatched.value = false;
        pinStatus.value = Strings.pinNotMatched;
      },
    );
  }

  _clearInputField() {
    pinCodeController.clear();
    oldPinCodeController.clear();
    newPinCodeController.clear();
  }
}
