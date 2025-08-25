import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/routes/routes.dart';

import '../../../../base/api/model/common_success_model.dart';
import '../../../../base/utils/basic_import.dart';
import '../../../menu_section/profile/controller/profile_controller.dart';
import '../../auth_model/kyc_info_model.dart';
import '../widget/dynamic_input_field.dart';

class KycInformationController extends GetxController {
  @override
  void onInit() {
    kycInfoProcess();
    emailAddressController.addListener(_updateFormValidity);

    super.onInit();
  }

  List<TextEditingController> inputFieldControllers = [];
  final emailAddressController = TextEditingController();
  RxBool isFormValid = false.obs;
  RxBool showSubmitForm = false.obs;
  RxString selectedTransactionItem = ''.obs;
  RxList inputFields = [].obs;
  RxList inputFileFields = [].obs;
  List<String> dropdownList = <String>[].obs;
  RxString selectType = "".obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxBool hasFile = false.obs;
  RxInt kycStatus = (-1).obs;

  @override
  void onClose() {
    emailAddressController.dispose();
    super.onClose();
  }

  void _updateFormValidity() {
    isFormValid.value = emailAddressController.text.isNotEmpty;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late KycInfoModel _kycInfoModel;
  KycInfoModel get kycInfoModel => _kycInfoModel;

  Future<KycInfoModel?> kycInfoProcess() async {
    inputFields.clear();
    inputFileFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    return RequestProcess().request<KycInfoModel>(
      fromJson: KycInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.kycInfo,
      isLoading: _isLoading,
      showSuccessMessage: false,
      onSuccess: (value) {
        _kycInfoModel = value!;
        var data = _kycInfoModel.data.inputFields;
        kycStatus.value = _kycInfoModel.data.kycStatus;

        if (showSubmitForm.value) {
          getDynamicInputField(
            data: data,
            inputFieldControllers: inputFieldControllers,
            inputFields: inputFields,
            inputFileFields: inputFileFields,
            hasFile: hasFile,
            selectType: selectType,
            isAvailableData: false,
          );
        } else {
          if (_kycInfoModel.data.kycStatus == 0) {
            getDynamicInputField(
              data: data,
              inputFieldControllers: inputFieldControllers,
              inputFields: inputFields,
              inputFileFields: inputFileFields,
              hasFile: hasFile,
              selectType: selectType,
              isAvailableData: false,
            );
          } else {
            Get.find<ProfileController>().getProfileInfo().then((value) {
              getDynamicInputField(
                data: value!.data.userInfo.kyc.data,
                inputFieldControllers: inputFieldControllers,
                inputFields: inputFields,
                inputFileFields: inputFileFields,
                hasFile: hasFile,
                selectType: selectType,
                isAvailableData: true,
                kycImagePaths: value.data.kycImagePaths,
              );
            });
          }
        }
      },
    );
  }

  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> kycSubmitProcess() async {
    Map<String, String> inputBody = {};
    final data = kycInfoModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.kycSubmit,
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
        kycInfoProcess();
        showSubmitForm.value = false;
        Routes.navigation.offAllNamed;
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

  // routes
  void onSkip() {
    Routes.navigation.offAllNamed;
  }
}
