import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/model/common_success_model.dart';
import '../../../../base/utils/basic_import.dart';
import '../../auth_model/two_fa_model.dart';

class TwoFaController extends GetxController {
  final qrSecretController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getTwoFaInfoProcess();
  }

  get onUpdateTwoFaStatus => updateTwoFaStatus();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late TwoFaModel _twoFaModel;
  TwoFaModel get twoFaModel => _twoFaModel;

  Future<TwoFaModel?> getTwoFaInfoProcess() async {
    return RequestProcess().request<TwoFaModel>(
      fromJson: TwoFaModel.fromJson,
      apiEndpoint: ApiEndpoint.twoFaInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _twoFaModel = value!;
        qrSecretController.text = _twoFaModel.data.qrSecrete;
      },
    );
  }

  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> updateTwoFaStatus() async {
    Map<String, dynamic> inputBody = {
      'status': _twoFaModel.data.qrStatus == 0 ? 1 : 0,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.twoFaStatusUpdate,
      isLoading: _isUpdateLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        getTwoFaInfoProcess();
      },
    );
  }
}
