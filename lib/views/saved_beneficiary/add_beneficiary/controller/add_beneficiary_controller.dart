import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/model/common_success_model.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../../routes/routes.dart';
import '../../../auth/kyc_information/controller/kyc_information_controller.dart';
import '../../../navigation/controller/navigation_controller.dart';
import '../../model/account_details_model.dart';
import '../../model/beneficiary_bank_model.dart';
import '../../model/beneficiary_method_model.dart';

class AddBeneficiaryController extends GetxController {
  @override
  void onInit() {
    getBeneficiaryBank().then((v) => getMethodInfo());
    super.onInit();
  }

  final accountNumberController = TextEditingController();
  final accountHolderNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Rxn<BankList> selectBank = Rxn<BankList>();
  Rxn<Branch> selectBranch = Rxn<Branch>();
  RxString accountType = Strings.selectType.obs;
  Rxn<MethodModel> beneficiaryType = Rxn<MethodModel>();

  RxString accountDetailsStatus = ''.obs;

  // Get list info
  final List<BankList> beneficiaryBankList = [];
  final RxList<Branch> beneficiaryBranchList = <Branch>[].obs;
  final List<MethodModel> beneficiaryMethodList = [];
  final List<String> typeList = [Strings.account];

  // on process
  get onSubmit => beneficiaryStore().then(
        (value) {
          Get.offAllNamed(Routes.navigation);
          Get.find<NavigationController>().selectedIndex.value = 1;
        },
      );

  // Get Beneficiary Bank
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late BeneficiaryBankModel _beneficiaryBankModel;
  BeneficiaryBankModel get beneficiaryBankModel => _beneficiaryBankModel;

  Future<BeneficiaryBankModel?> getBeneficiaryBank() async {
    return RequestProcess().request<BeneficiaryBankModel>(
      fromJson: BeneficiaryBankModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiaryBank,
      isLoading: _isLoading,
      onSuccess: (value) {
        _beneficiaryBankModel = value!;
        selectBank.value = _beneficiaryBankModel.data.bankList.first;
        selectBranch.value =
            _beneficiaryBankModel.data.bankList.first.branches.first;

        _beneficiaryBankModel.data.bankList.forEach(
          (v) {
            beneficiaryBankList.add(
              BankList(
                bankId: v.bankId,
                bankName: v.bankName,
                branches: v.branches,
              ),
            );
          },
        );
      },
    );
  }

  // Get  Beneficiary Method
  final _isMethodLoading = false.obs;
  bool get isMethodLoading => _isMethodLoading.value;

  late BeneficiaryMethodModel _beneficiaryMethodModel;
  BeneficiaryMethodModel get beneficiaryMethodModel => _beneficiaryMethodModel;

  Future<BeneficiaryMethodModel?> getMethodInfo() async {
    return RequestProcess().request<BeneficiaryMethodModel>(
      fromJson: BeneficiaryMethodModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiaryMethod,
      isLoading: _isMethodLoading,
      onSuccess: (value) {
        _beneficiaryMethodModel = value!;
        beneficiaryType.value = _beneficiaryMethodModel.data.methods.first;
        beneficiaryType.value = MethodModel(
          slug: 'slug',
          name: Strings.selectType,
        );
        beneficiaryMethodModel.data.methods.forEach(
          (v) {
            beneficiaryMethodList.add(
              MethodModel(
                slug: v.slug,
                name: v.name,
              ),
            );
          },
        );
      },
    );
  }

  // Beneficiary Store
  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> beneficiaryStore() async {
    if (Get.find<KycInformationController>().kycStatus.value != 1) {
      CustomSnackBar.error(
        Strings.kycStatusDetails,
      );
      Get.toNamed(Routes.kycInformationScreen);
    } else {
      Map<String, dynamic> otherBankInputBody = {
        'method': beneficiaryType.value!.slug,
        'beneficiary_subtype':
            accountType.value == Strings.account ? 'account' : '',
        'account_number': accountNumberController.text,
        'account_holder_name': accountHolderNameController.text,
        'email': emailController.text,
        'bank': selectBank.value!.bankId,
        'branch': selectBranch.value!.id,
        'phone': phoneController.text,
      };

      Map<String, dynamic> ownBankInputBody = {
        'method': beneficiaryType.value!.slug,
        'beneficiary_subtype':
            accountType.value == Strings.account ? 'account' : '',
        'account_number': accountNumberController.text,
        'account_holder_name': accountHolderNameController.text,
        'email': emailController.text,
      };

      return RequestProcess().request<CommonSuccessModel>(
        fromJson: CommonSuccessModel.fromJson,
        apiEndpoint: ApiEndpoint.beneficiaryStore,
        isLoading: _isSubmitLoading,
        method: HttpMethod.POST,
        showSuccessMessage: true,
        body: beneficiaryType.value!.slug == 'other-bank-transfer'
            ? otherBankInputBody
            : ownBankInputBody,
        onSuccess: (value) {
          _commonSuccessModel = value!;
        },
      );
    }
    return null;
  }

  // Account Details by account number
  final _isAccountDetailsLoading = false.obs;
  bool get isAccountDetailsLoading => _isAccountDetailsLoading.value;

  late AccountDetailsModel _accountDetailsModel;
  AccountDetailsModel get accountDetailsModel => _accountDetailsModel;

  Future<AccountDetailsModel?> accountDetails(
      {required String accountNumber}) async {
    Map<String, dynamic> inputBody = {
      'account_number': accountNumber,
    };

    return RequestProcess().request<AccountDetailsModel>(
      fromJson: AccountDetailsModel.fromJson,
      apiEndpoint: ApiEndpoint.beneficiaryAccountDetails,
      isLoading: _isAccountDetailsLoading,
      method: HttpMethod.POST,
      showErrorMessage: false,
      body: inputBody,
      onSuccess: (value) {
        _accountDetailsModel = value!;
        var accountDetails = _accountDetailsModel.data.accountDetails;
        accountHolderNameController.text = accountDetails.name;
        emailController.text = accountDetails.email;
        accountDetailsStatus.value = '';
      },
      onError: (e) {
        accountDetailsStatus.value = Strings.accountDoesNotExists;
        accountHolderNameController.text = '';
        emailController.text = '';
      },
    );
  }
}
