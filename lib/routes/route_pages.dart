part of '../routes/routes.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.pinSetupScreen,
      page: () => const PinSetupScreen(),
      binding: SetupPinBinding(),
    ),
    GetPage(
      name: Routes.bankStatementScreen,
      page: () => const BankStatementScreen(),
      binding: BankStatementBinding(),
    ),
    GetPage(
      name: Routes.strowalletCardTransactionScreen,
      page: () => const StrowalletCardTransactionScreen(),
      binding: StrowalletCardTransactionBinding(),
    ),
    GetPage(
      name: Routes.updateCustomerKycScreen,
      page: () => UpdateCustomerKycScreen(),
    ),
    GetPage(
      name: Routes.strowalletAddFundScreen,
      page: () => const StrowalletAddFundScreen(),
      binding: StrowalletAddFundBinding(),
    ),
    GetPage(
      name: Routes.strowalletDetailsScreen,
      page: () => const StrowalletDetailsScreen(),
      binding: StrowalletDetailsBinding(),
    ),
    GetPage(
      name: Routes.strowalletCardCreateScreen,
      page: () => const StrowalletCardCreateScreen(),
      binding: StrowalletCardCreateBinding(),
    ),
    GetPage(
      name: Routes.transferMoneyPreview,
      page: () => TransferMoneyPreview(),
    ),
    GetPage(
      name: Routes.moneyOutPreview,
      page: () => MoneyOutPreview(),
    ),
    GetPage(
      name: Routes.instructionsFieldWidget,
      page: () => InstructionsFieldWidget(),
    ),
    GetPage(
      name: Routes.addBeneficiaryScreen,
      page: () => const AddBeneficiaryScreen(),
      binding: AddBeneficiaryBinding(),
    ),
    GetPage(
      name: Routes.moneyOutScreen,
      page: () => const MoneyOutScreen(),
      binding: MoneyOutBinding(),
    ),
    GetPage(
      name: Routes.twoFaVerificationScreenScreen,
      page: () => const TwoFaVerificationScreenScreen(),
      binding: TwoFaVerificationBinding(),
    ),
    GetPage(
      name: Routes.twoFaScreen,
      page: () => const TwoFaScreen(),
      binding: TwoFaBinding(),
    ),
    GetPage(
      name: Routes.addMoneyManualFieldWidget,
      page: () => AddMoneyManualFieldWidget(),
    ),
    GetPage(
      name: Routes.transactionHistoryScreen,
      page: () => const TransactionHistoryScreen(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Routes.drawerMenuScreen,
      page: () => const DrawerMenuScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.transferMoneyScreen,
      page: () => const TransferMoneyScreen(),
      binding: TransferMoneyBinding(),
    ),
    GetPage(
      name: Routes.addMoneyScreen,
      page: () => const AddMoneyScreen(),
      binding: AddMoneyBinding(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.navigation,
      page: () => const NavigationScreen(),
      binding: NavigationBindings(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnboardScreen(),
      bindings: [
        OnboardBinding(),
        LoginBindings(),
        RegistrationBinding(),
      ],
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: Routes.registrationEmailVerifyScreen,
      page: () => const RegistrationEmailVerifyScreen(),
      binding: RegistrationEmailBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.kycInformationScreen,
      page: () => const KycInformationScreen(),
      binding: KycInformationBinding(),
    ),
    GetPage(
      name: Routes.navigation,
      page: () => const KycInformationScreen(),
      binding: KycInformationBinding(),
    ),
  ];
}
