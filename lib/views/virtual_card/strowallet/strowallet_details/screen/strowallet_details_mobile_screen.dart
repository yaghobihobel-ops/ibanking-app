part of 'strowallet_details_screen.dart';

class StrowalletDetailsMobileScreen
    extends GetView<StrowalletDetailsController> {
  const StrowalletDetailsMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.cardDetails),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: ListView(
          children: [
            _currentBalance(),
            _cardDetails(),
            _status(),
            _billingAddress(),
          ],
        ),
      ),
    );
  }

  _currentBalance() {
    var myCard = controller.strowalletCardDetailsModel.data.data.myCards;
    var baseCurrencyCode =
        controller.strowalletCardDetailsModel.data.data.baseCurr;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      margin: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.5,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSize,
        ),
        child: Column(
          children: [
            TextWidget(
              Strings.currentBalance,
              typographyStyle: TypographyStyle.bodySmall,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 0.3,
              ),
              colorShade: ColorShade.mediumFifty,
            ),
            Sizes.height.v5,
            Row(
              mainAxisAlignment: mainCenter,
              children: [
                TextWidget(
                  myCard.first.amount.toStringAsFixed(2),
                  typographyStyle: TypographyStyle.headlineSmall,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.3,
                  ),
                ),
                TextWidget(
                  baseCurrencyCode,
                  color: CustomColor.primary,
                  typographyStyle: TypographyStyle.headlineSmall,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _cardDetails() {
    var myCard = controller.strowalletCardDetailsModel.data.data.myCards.first;
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              Strings.cardDetails,
              typographyStyle: TypographyStyle.titleMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.cardType,
              value: Strings.cardBrand,
            ),
            DoubleSideTextWidget(
              keys: myCard.cardType,
              value: myCard.cardBrand,
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.cvv,
              value: Strings.expiration,
            ),
            DoubleSideTextWidget(
              keys: myCard.cvv,
              value: myCard.expiry,
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.cardId,
              value: Strings.customerId,
            ),
            DoubleSideTextWidget(
              keys: myCard.cardId,
              value: myCard.cardNumber,
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.city,
              value: Strings.state,
            ),
            DoubleSideTextWidget(
              keys: myCard.city,
              value: myCard.state,
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            DoubleSideTextWidget(
              keys: Strings.zipCode,
              value: Strings.customerId,
            ),
            DoubleSideTextWidget(
              keys: myCard.zipCode,
              value: myCard.cardUserId,
              keyStyle: TypographyStyle.bodyMedium,
              valueStyle: TypographyStyle.bodyMedium,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  _billingAddress() {
    var businessAddress =
        controller.strowalletCardDetailsModel.data.data.businessAddress;
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              Strings.billingAddress,
              typographyStyle: TypographyStyle.titleMedium,
              fontWeight: FontWeight.w500,
            ),
            Column(
              children: List.generate(
                (businessAddress.length / 2).ceil(),
                (index) {
                  final firstItem = businessAddress[index * 2];
                  final secondItem = index * 2 + 1 < businessAddress.length
                      ? businessAddress[index * 2 + 1]
                      : null;

                  return Column(
                    children: [
                      DividerWidget(),
                      DoubleSideTextWidget(
                        keys: firstItem.labelName,
                        value: (secondItem != null
                            ? "${secondItem.labelName}"
                            : ""),
                      ),
                      DoubleSideTextWidget(
                        keys: firstItem.value,
                        value:
                            (secondItem != null ? "${secondItem.value}" : ""),
                        keyStyle: TypographyStyle.bodyMedium,
                        valueStyle: TypographyStyle.bodyMedium,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _status() {
    var myCard = controller.strowalletCardDetailsModel.data.data.myCards.first;
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSize * 0.6,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              Strings.statusUpdate,
              typographyStyle: TypographyStyle.titleMedium,
              fontWeight: FontWeight.w500,
            ),
            DividerWidget(),
            Sizes.height.v5,
            Obx(
              () => controller.isFreezedLoading
                  ? Loader()
                  : CustomSwitch(
                      firstText: Strings.unFreeze,
                      secondText: Strings.freeze,
                      selectedValue: myCard.status,
                      onChange: (bool value) {
                        if (value) {
                          controller.cardUnfreeze();
                        } else {
                          controller.cardFreezed();
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
