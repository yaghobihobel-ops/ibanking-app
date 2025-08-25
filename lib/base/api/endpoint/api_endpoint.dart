import 'package:dynamic_languages/dynamic_languages.dart';

class ApiConfig {
  static const String mainDomain = "https://pay.gops.shop";
  static const String baseUrl = "$mainDomain/api";
  static const String languageUrl = "$baseUrl/settings/languages";
}

enum ApiEndpoint {
  // Settings
  basicSettings('/settings/basic-settings'),

  // Auth
  login('/login'),
  forgotPassword('/password/forgot/find/user'),
  forgotPasswordVerifyCode('/password/forgot/verify/code'),
  resendForgotOtpCode('/password/forgot/resend/code'),
  resetPassword('/password/forgot/reset'),

  register('/register'),
  emailOtpVerify('/authorize/mail/verify/code'),
  resendEmailOtp('/authorize/mail/resend/code'),

  kycInfo('/user/kyc-input-fields'),
  kycSubmit('/user/kyc-submit'),

  // 2FA
  twoFaInfo('/user/google-2fa'),
  twoFaStatusUpdate('/user/google-2fa/status/update'),
  twoFaOtpVerify('/user/google-2fa/verify/code'),

  logOut('/user/logout'),

  // Setup Pin
  setupPinStore('/user/setup-pin/store'),
  setupPinUpdate('/user/setup-pin/update'),
  pinCheck('/user/pin-check'),

  // Dashboard
  dashboardInfo('/user/dashboard'),

  // Notification
  notification('/user/notifications'),

  // Transfer Money
  beneficiarySelect('/user/fund-transfer/beneficiary-select'),
  chargeInfo('/user/fund-transfer/charge-info'),
  moneyTransferSubmit('/user/fund-transfer/submit'),
  moneyTransferConfirm('/user/fund-transfer/confirm'),

  // Profile
  profileInfo('/user/profile/info'),
  updateProfile('/user/profile/info/update'),
  updatePassword('/user/profile/password/update'),
  deleteAccount('/user/profile/delete-account'),

  // Card
  cardInfo('/user/card-method/all'),
  cardStore('/user/card-method/store'),
  cardDefault('/user/card-method/make-default'),
  cardDelete('/user/card-method/delete'),

  // Transaction Log
  transactionLog('/user/transaction/log'),

  // Add Money
  addMoneyConfirm('/user/add-money/automatic/submit'),
  addMoneyManualConfirm('/user/add-money/manual/submit'),
  addMoneyManualInput('/user/add-money/manual/input-fields'),
  addMoneyInfo('/user/add-money/payment-gateways'),

  // Beneficiary
  beneficiaryList('/user/beneficiary'),
  beneficiaryMethod('/user/beneficiary/methods'),
  beneficiaryBank('/user/beneficiary/bank-list'),
  beneficiaryFindBranch('/user/beneficiary/find-branch'),
  beneficiaryAccountDetails('/user/beneficiary/account-details'),
  beneficiaryStore('/user/beneficiary/store'),
  beneficiaryDelete('/user/beneficiary/delete'),

  // Strowallet Virtual Card
  strowalletCard('/user/strowallet-card'),
  strowalletCardCharges('/user/strowallet-card/charges'),
  strowalletCardCreateInfo('/user/strowallet-card/create/info'),
  strowalletCardUpdateCustomerStatus(
      '/user/strowallet-card/update/customer/status'),
  strowalletCardCreateCustomer('/user/strowallet-card/create/customer'),
  strowalletCardUpdateCustomer('/user/strowallet-card/update/customer'),
  strowalletCardDetails('/user/strowallet-card/details'),
  strowalletCardBlock('/user/strowallet-card/block'),
  strowalletCardUnblock('/user/strowallet-card/unblock'),
  strowalletCardFund('/user/strowallet-card/fund'),
  strowalletCardTransaction('/user/strowallet-card/transaction'),
  strowalletCardMakeRemoveDefault('/user/strowallet-card/make-remove/default'),
  strowalletBuyCard('/user/strowallet-card/create'),

  // Bank Statement
  bankStatement('/user/statement'),

  // Money Out
  moneyOutInfo('/user/money-out/info'),
  moneyOutSubmit('/user/money-out/submit'),
  moneyOutInstruction('/user/money-out/instruction'),
  moneyOutInstructionSubmit('/user/money-out/instruction-submit'),
  moneyOutConfirm('/user/money-out/confirm');

  final String path;
  const ApiEndpoint(this.path);

  /// Returns the full URL with optional query parameters
  String url({Map<String, String>? params}) {
    var fullUrl = "${ApiConfig.baseUrl}$path";
    if (params != null && params.isNotEmpty) {
      fullUrl +=
          '?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}&?lang=${DynamicLanguage.selectedLanguage.value}';
    } else {
      fullUrl += '?lang=${DynamicLanguage.selectedLanguage.value}';
    }
    return fullUrl;
  }

  /// Convenience method to append query parameters
  String withParams(Map<String, String> params) => url(params: params);
}
