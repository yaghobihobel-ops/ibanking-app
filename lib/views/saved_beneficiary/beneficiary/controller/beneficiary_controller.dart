import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/model/common_success_model.dart';
import '../../../../base/utils/basic_import.dart';
import '../../model/beneficiary_model.dart';

class BeneficiaryController extends GetxController {
  final searchController = TextEditingController();
  RxList<Beneficiary> filteredBeneficiaryList = <Beneficiary>[].obs;

  RxString selectSlug = ''.obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    getBeneficiaryInfo();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late BeneficiaryModel _beneficiaryModel;
  BeneficiaryModel get beneficiaryModel => _beneficiaryModel;

  Future<BeneficiaryModel?> getBeneficiaryInfo() async {
    return RequestProcess().request<BeneficiaryModel>(
      fromJson: BeneficiaryModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiaryList,
      isLoading: _isLoading,
      onSuccess: (value) {
        _beneficiaryModel = value!;
        filteredBeneficiaryList.assignAll(_beneficiaryModel.data.beneficiary);
      },
    );
  }

  // Beneficiary Delete
  final _isDeleteLoading = false.obs;
  bool get isDeleteLoading => _isDeleteLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> deleteBeneficiary() async {
    Map<String, dynamic> inputBody = {
      'slug': selectSlug.value,
    };
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiaryDelete,
      isLoading: _isDeleteLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        Get.close(1);
        getBeneficiaryInfo();
      },
    );
  }

  // Beneficiary Search
  void searchBeneficiaries(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredBeneficiaryList.assignAll(_beneficiaryModel.data.beneficiary);
    } else {
      filteredBeneficiaryList.assignAll(
        _beneficiaryModel.data.beneficiary.where(
          (beneficiary) => beneficiary.accountHolderName
              .toLowerCase()
              .contains(query.toLowerCase()),
        ),
      );
    }
  }
}
