import 'package:get/get.dart';
import 'package:ibanking/bindings/profile_binding.dart';
import 'package:ibanking/bindings/splash_binding.dart';
import 'package:ibanking/views/onboard/screen/onboard_screen.dart';
import 'package:ibanking/views/splash/screen/splash_screen.dart';

import '../bindings/add_beneficiary_binding.dart';
import '../bindings/add_money_binding.dart';
import '../bindings/bank_statement_binding.dart';
import '../bindings/change_password_binding.dart';
import '../bindings/forgot_password_binding.dart';
import '../bindings/kyc_information_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/money_out_binding.dart';
import '../bindings/navigation_bindings.dart';
import '../bindings/notification_binding.dart';
import '../bindings/onboard_binding.dart';
import '../bindings/otp_verification_binding.dart';
import '../bindings/reg_email_binding.dart';
import '../bindings/registration_binding.dart';
import '../bindings/setup_pin_binding.dart';
import '../bindings/strowallet_add_fund_binding.dart';
import '../bindings/strowallet_card_create_binding.dart';
import '../bindings/strowallet_card_transaction_binding.dart';
import '../bindings/strowallet_details_binding.dart';
import '../bindings/transaction_history_binding.dart';
import '../bindings/transfer_money_binding.dart';
import '../bindings/two_fa_binding.dart';
import '../bindings/two_fa_verification_binding.dart';
import '../views/add_money/screen/add_money_screen.dart';
import '../views/add_money/widget/add_money_manual_field_widget.dart';
import '../views/auth/forgot_password/screen/forgot_password_screen.dart';
import '../views/auth/kyc_information/screen/kyc_information_screen.dart';
import '../views/auth/login/screen/login_screen.dart';
import '../views/auth/otp_verification/screen/otp_verification_screen.dart';
import '../views/auth/registration/screen/registration_screen.dart';
import '../views/auth/registration_email_verify/screen/registration_email_verify_screen.dart';
import '../views/auth/reset_password/screen/reset_password_screen.dart';
import '../views/auth/two_fa/screen/two_fa_screen.dart';
import '../views/auth/two_fa_verification_screen/screen/two_fa_verification_screen_screen.dart';
import '../views/bank_statement/screen/bank_statement_screen.dart';
import '../views/logs/notification/screen/notification_screen.dart';
import '../views/logs/transaction_history/screen/transaction_history_screen.dart';
import '../views/menu_section/change_password/screen/change_password_screen.dart';
import '../views/menu_section/drawer_menu/screen/drawer_menu_screen.dart';
import '../views/menu_section/profile/screen/profile_screen.dart';
import '../views/menu_section/settings/screen/settings_screen.dart';
import '../views/money_out/screen/money_out_screen.dart';
import '../views/money_out/widget/instructions_field_widget.dart';
import '../views/money_out/widget/money_out_preview.dart';
import '../views/navigation/screen/navigation_screen.dart';
import '../views/pin_setup/screen/pin_setup_screen.dart';
import '../views/saved_beneficiary/add_beneficiary/screen/add_beneficiary_screen.dart';
import '../views/transfer_money/screen/transfer_money_screen.dart';
import '../views/transfer_money/widget/transfer_money_preview.dart';
import '../views/virtual_card/strowallet/strowallet_add_fund/screen/strowallet_add_fund_screen.dart';
import '../views/virtual_card/strowallet/strowallet_card_create/screen/strowallet_card_create_screen.dart';
import '../views/virtual_card/strowallet/strowallet_card_create/widget/update_customer_kyc_screen.dart';
import '../views/virtual_card/strowallet/strowallet_card_transaction/screen/strowallet_card_transaction_screen.dart';
import '../views/virtual_card/strowallet/strowallet_details/screen/strowallet_details_screen.dart';

part '../routes/route_pages.dart';

class Routes {
  // Page List
  static var list = RoutePageList.list;

  // Route Names
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboardScreen';
  static const String loginScreen = '/loginScreen';
  static const String otpVerificationScreen = '/otpVerificationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String registrationEmailVerifyScreen =
      '/registrationEmailVerifyScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String kycInformationScreen = '/kycInformationScreen';
  static const String navigation = '/navigation';
  static const String notificationScreen = '/notificationScreen';
  static const String merchantDetailsScreen = '/merchantDetailsScreen';
  static const String addMoneyScreen = '/addMoneyScreen';
  static const String transferMoneyScreen = '/transferMoneyScreen';

  static const String drawerMenuScreen = '/drawerMenuScreen';
  static const String profileScreen = '/profileScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String transactionHistoryScreen = '/transactionHistoryScreen';
  static const String addMoneyManualFieldWidget = '/addMoneyManualFieldWidget';
  static const String twoFaScreen = '/twoFaScreen';
  static const String twoFaVerificationScreenScreen =
      '/twoFaVerificationScreenScreen';

  static const String moneyOutScreen = '/moneyOutScreen';
  static const String instructionsFieldWidget = '/instructionsFieldWidget';

  static const String addBeneficiaryScreen = '/addBeneficiaryScreen';
  static const String moneyOutPreview = '/moneyOutPreview';
  static const String transferMoneyPreview = '/transferMoneyPreview';

  // strowallet
  static const String strowalletAddFundScreen = '/strowalletAddFundScreen';
  static const String strowalletDetailsScreen = '/strowalletDetailsScreen';
  static const String strowalletCardCreateScreen =
      '/strowalletCardCreateScreen';
  static const String strowalletCustomerCreateScreen =
      '/strowalletCustomerCreateScreen';
  static const String updateCustomerKycScreen = '/updateCustomerKycScreen';
  static const String bankStatementScreen = '/bankStatementScreen';
  static const String strowalletCardTransactionScreen =
      '/strowalletCardTransactionScreen';
  static const String pinSetupScreen = '/pinSetupScreen';
}
