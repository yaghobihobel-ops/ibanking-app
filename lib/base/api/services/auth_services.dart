import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../views/auth/auth_model/forgot_password_and_verify_model.dart';
import '../../../views/auth/auth_model/register_model.dart';
import '../../../views/auth/login/model/sign_in_model.dart';
import '../../utils/basic_import.dart';
import '../../utils/local_storage.dart';
import '../model/common_success_model.dart';

class AuthServices {
  static late LogInModel _logInModel;
  LogInModel get logInModel => _logInModel;

  static late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  static late ForgotPasswordAndVerifyModel _forgotPasswordAndVerifyModel;
  ForgotPasswordAndVerifyModel get forgotPasswordAndVerifyModel =>
      _forgotPasswordAndVerifyModel;

  static late RegisterModel _registerModel;
  RegisterModel get registerModel => _registerModel;

  static Future<LogInModel?> logInService({
    required String credentials,
    required String password,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {
      'credentials': credentials,
      'password': password,
    };
    return RequestProcess().request<LogInModel>(
      fromJson: LogInModel.fromJson,
      apiEndpoint: ApiEndpoint.login,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      isBasic: true,
      onSuccess: (value) {
        _logInModel = value!;
        var data = _logInModel.data;
        LocalStorage.save(
          token: data.token,
          temporaryToken: data.authorization.token,
          isEmailVerified: data.userInfo.emailVerified == 1,
          email: data.userInfo.email,
          kycStatus: data.userInfo.kycVerified,
        );
        if (data.userInfo.emailVerified == 1) {
          if (data.userInfo.twoFactorStatus == 1 &&
              data.userInfo.twoFactorVerified == 0) {
            Get.toNamed(Routes.twoFaVerificationScreenScreen);
            LocalStorage.save(
              isLoggedIn: true,
            );
          } else {
            Get.offAllNamed(Routes.navigation);
            LocalStorage.save(
              isLoggedIn: true,
            );
          }
        } else {
          Get.toNamed(Routes.registrationEmailVerifyScreen);
        }
      },
    );
  }

  static Future<ForgotPasswordAndVerifyModel?> forgotPasswordProcess({
    required String credentials,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {'credentials': credentials};
    return RequestProcess().request<ForgotPasswordAndVerifyModel>(
      fromJson: ForgotPasswordAndVerifyModel.fromJson,
      apiEndpoint: ApiEndpoint.forgotPassword,
      isLoading: isLoading,
      method: HttpMethod.POST,
      isBasic: true,
      body: inputBody,
      onSuccess: (value) {
        _forgotPasswordAndVerifyModel = value!;
        var data = _forgotPasswordAndVerifyModel.data;
        LocalStorage.save(
          temporaryToken: data.token,
        );
        Get.toNamed(Routes.otpVerificationScreen);
      },
    );
  }

  static Future<CommonSuccessModel?> resendForgotOtpCode({
    required RxBool isResendLoading,
  }) async {
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.resendForgotOtpCode,
      queryParams: {'token': LocalStorage.temporaryToken},
      isLoading: isResendLoading,
      onSuccess: (value) {
        _commonSuccessModel = value!;
      },
    );
  }

  static Future<ForgotPasswordAndVerifyModel?> otpVerifyProcess({
    required String code,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {
      'token': LocalStorage.temporaryToken,
      'code': code,
    };

    return RequestProcess().request<ForgotPasswordAndVerifyModel>(
      fromJson: ForgotPasswordAndVerifyModel.fromJson,
      apiEndpoint: ApiEndpoint.forgotPasswordVerifyCode,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _forgotPasswordAndVerifyModel = value!;
        Routes.resetPasswordScreen.toNamed;
      },
    );
  }

  static Future<CommonSuccessModel?> resetPasswordProcess({
    required RxBool isLoading,
    required String password,
    required String confirmPassword,
  }) async {
    Map<String, dynamic> inputBody = {
      'token': LocalStorage.temporaryToken,
      'password': password,
      'password_confirmation': confirmPassword,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.resetPassword,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      showSuccessMessage: true,
      onSuccess: (value) {
        Get.offNamed(Routes.loginScreen);
      },
    );
  }

  // Register
  static Future<RegisterModel?> registrationProcess({
    required String accountType,
    required String firstName,
    required String lastName,
    required String country,
    required String companyName,
    required String email,
    required String password,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {
      'account_type':
          accountType == Strings.personalAccount ? 'personal' : 'business',
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'country': country,
      'company_name': companyName,
      'password': password,
      'password_confirmation': password,
      'agree': 'on',
    };
    return RequestProcess().request<RegisterModel>(
      fromJson: RegisterModel.fromJson,
      apiEndpoint: ApiEndpoint.register,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      isBasic: true,
      onSuccess: (value) {
        _registerModel = value!;
        var data = _registerModel.data;
        LocalStorage.save(
          token: data.token,
          temporaryToken: data.authorization.token,
          isLoggedIn: true,
          isKycVerified: data.userInfo.kycVerified == 1,
          isEmailVerified: data.userInfo.emailVerified == 1,
          kycStatus: data.userInfo.kycVerified,
        );
        if (data.userInfo.emailVerified == 1) {
          if (data.userInfo.kycVerified == 1) {
            Routes.navigation.offAllNamed;
            LocalStorage.save(isLoggedIn: true);
          } else {
            Routes.kycInformationScreen.toNamed;
            LocalStorage.save(isLoggedIn: true);
          }
        } else {
          Routes.registrationEmailVerifyScreen.toNamed;
        }
      },
    );
  }

  static Future<CommonSuccessModel?> emailVerifyProcess({
    required String code,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {
      'token': LocalStorage.temporaryToken,
      'code': code,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.emailOtpVerify,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;

        if (LocalStorage.kycStatus == 0) {
          Routes.kycInformationScreen.toNamed;
        } else {
          Routes.navigation.offAllNamed;
          LocalStorage.save(
            isLoggedIn: true,
          );
        }
      },
    );
  }

  static Future<CommonSuccessModel?> resendEmailOtpCode({
    required RxBool isResendLoading,
  }) async {
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.resendEmailOtp,
      queryParams: {'token': LocalStorage.temporaryToken},
      isLoading: isResendLoading,
      onSuccess: (value) {
        _commonSuccessModel = value!;
      },
    );
  }

  // Two Fa Otp Verification Process
  static Future<CommonSuccessModel?> twoFaOtpVerifyProcess({
    required String otp,
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {
      'otp': otp,
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.twoFaOtpVerify,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        Routes.navigation.offAllNamed;
      },
    );
  }

  // Log Out
  static Future<CommonSuccessModel?> logOutService({
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {};
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.logOut,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        Get.offAllNamed(Routes.loginScreen);
        LocalStorage.clear();
      },
    );
  }

  static Future<CommonSuccessModel?> deleteAccountServices({
    required RxBool isLoading,
  }) async {
    Map<String, dynamic> inputBody = {};
    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.deleteAccount,
      isLoading: isLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        Get.offAllNamed(Routes.loginScreen);
        LocalStorage.clear();
      },
    );
  }
}
