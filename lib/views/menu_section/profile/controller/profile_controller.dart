import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/local_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../base/api/model/common_success_model.dart';
import '../../../../base/utils/basic_import.dart';
import '../model/profile_info_model.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalCodeController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isFormValid = false.obs;
  RxString userImage = ''.obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString accountNumber = ''.obs;
  RxBool isAvailableUserImage = false.obs;
  RxString countrySelectMethod = ''.obs;
  List<Country> countryList = [];
  List<String> genderList = [Strings.male, Strings.female];
  RxString selectedGender = Strings.male.obs;
  RxString selectedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    firstNameController.addListener(_updateFormValidity);
    lastNameController.addListener(_updateFormValidity);
    getProfileInfo();
  }

  void _updateFormValidity() {
    isFormValid.value = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  // Get Profile Info
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late ProfileInfoModel _profileInfoModel;
  ProfileInfoModel get profileInfoModel => _profileInfoModel;

  Future<ProfileInfoModel?> getProfileInfo() async {
    return RequestProcess().request<ProfileInfoModel>(
      fromJson: ProfileInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.profileInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _profileInfoModel = value!;
        _setProfileData();
      },
    );
  }

  void _setProfileData() {
    var userInfo = _profileInfoModel.data.userInfo;
    var imagePaths = _profileInfoModel.data.imagePaths;
    firstNameController.text = userInfo.firstname;
    lastNameController.text = userInfo.lastname;
    emailController.text = userInfo.email;
    mobileController.text = userInfo.mobile;
    countrySelectMethod.value = userInfo.address.country;
    cityController.text = userInfo.address.city;
    stateController.text = userInfo.address.state;
    postalCodeController.text = userInfo.address.zip;
    addressController.text = userInfo.address.address;

    if (userInfo.gender == '') {
      selectedGender.value = Strings.selectGender;
    } else {
      selectedGender.value = userInfo.gender;
    }

    selectedDate.value = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(userInfo.birthdate.toString()));

    userName.value = '${userInfo.firstname} ${userInfo.lastname}';
    userEmail.value = userInfo.email;
    accountNumber.value = userInfo.accountNumber;
    LocalStorage.save(email: userInfo.email);
    if (userInfo.image != '') {
      userImage.value =
          "${imagePaths.baseUrl}/${imagePaths.pathLocation}/${userInfo.image}";

      isAvailableUserImage.value = true;
    } else {
      userImage.value = "${imagePaths.baseUrl}/${imagePaths.defaultImage}";
    }

    _profileInfoModel.data.countries.forEach((element) {
      countryList.add(
        Country(
          id: element.id,
          name: element.name,
          mobileCode: element.mobileCode,
          currencyName: element.currencyName,
          currencyCode: element.currencyCode,
          currencySymbol: element.currencySymbol,
        ),
      );
    });
  }

  // Profile Update
  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> updateProfile() async {
    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'phone': mobileController.text,
      'country': countrySelectMethod.value,
      'city': cityController.text,
      'state': stateController.text,
      'address': addressController.text,
      'birthdate': selectedDate.value,
      'gender': selectedGender.value == Strings.male ? 'Male' : 'Female',
      'zip_code': postalCodeController.text,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.updateProfile,
      isLoading: _isUpdateLoading,
      method: HttpMethod.POST,
      fieldList: isImagePathSet.value ? ['image'] : null,
      pathList: isImagePathSet.value ? [imagePath.value] : null,
      body: inputBody,
      showSuccessMessage: true,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        getProfileInfo();
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.removeListener(_updateFormValidity);
    lastNameController.removeListener(_updateFormValidity);
    mobileController.removeListener(_updateFormValidity);
  }

  // Set Image
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  var isImagePathSet = false.obs;
  var imagePath = "".obs;

  void setImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }

  // image picker function
  Future pickImage(imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 40, // define image quality
        maxHeight: 600, // image height
        maxWidth: 600, // image width
      );
      if (image == null) return;
      pickedFile = File(image.path);
      setImagePath(pickedFile!.path);
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }
}
