class LocalStorageModel {
  final String token;
  final String temporaryToken;
  final bool onboardSave;
  final String waitTime;
  final bool isLoggedIn;
  final bool isEmailVerified;
  final bool isKycVerified;
  final bool isSmsVerified;
  final int kycStatus;

  LocalStorageModel(
    this.token,
    this.onboardSave,
    this.waitTime,
    this.isLoggedIn,
    this.isEmailVerified,
    this.isKycVerified,
    this.isSmsVerified,
    this.kycStatus, {
    required this.temporaryToken,
  });
}
