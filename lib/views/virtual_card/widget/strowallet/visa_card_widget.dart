import 'dart:io' show Platform;

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../base/utils/basic_import.dart';

class VisaCardWidget extends StatelessWidget {
  final String cardNumber,
      expiryDate,
      balance,
      validAt,
      cvv,
      logo,
      cardBankDetails,
      cardHolderName;
  final String? availableBalance;
  final String? cardBgNetwork;
  final bool isNetworkImage;
  const VisaCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardBankDetails,
    required this.cardHolderName,
    this.availableBalance,
    required this.expiryDate,
    required this.balance,
    required this.validAt,
    required this.cvv,
    required this.logo,
    this.isNetworkImage = true,
    this.cardBgNetwork = '',
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillFront,
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.6,
          vertical: Dimensions.paddingSize * 0.6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
          color: CustomColor.primary,
          image: DecorationImage(
            image: NetworkImage(cardBgNetwork!),
            scale: Platform.isAndroid ? 3 : 3,
            fit: BoxFit.cover,
          ),
        ),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: mainMin,
            crossAxisAlignment: crossStart,
            children: [
              _bandLogo(),
              _chipWidget(),
              _cardNumber(),
              _valid(),
              _cardHolderName(),
            ],
          ),
        ),
      ),
      back: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSize * 0.6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
          color: CustomColor.primary,
          image: DecorationImage(
            image: NetworkImage(cardBgNetwork!),
            scale: Platform.isAndroid ? 3 : 3,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: crossEnd,
          children: [
            Sizes.height.v10,
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.7),
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 0.35,
                vertical: Dimensions.verticalSize * 0.2,
              ),
              child: TextWidget(
                Strings.cvv,
                maxLines: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 0.35,
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSize * 0.24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius * 0.3,
                ),
              ),
              child: Row(
                mainAxisAlignment: mainEnd,
                children: [
                  TextWidget(
                    cvv,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    typographyStyle: TypographyStyle.labelLarge,
                  ),
                  Sizes.width.v10,
                ],
              ),
            ),
            Sizes.height.v10,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 0.35,
              ),
              child: TextWidget(
                cardBankDetails,
                maxLines: 3,
                fontWeight: FontWeight.w600,
                typographyStyle: TypographyStyle.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _chipWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.4,
      ),
      child: SvgPicture.string(
          '''<svg width="77" height="34" viewBox="0 0 77 34" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="0.409779" y="0.952748" width="41.9627" height="31.773" rx="6.14668" fill="#DDD9D6" stroke="#666666" stroke-width="0.819558"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M27.4043 7.69809C25.9422 4.77837 23.6453 2.48576 22.1344 1.58989C22.0345 1.53211 21.9616 1.43701 21.9318 1.32551C21.902 1.21402 21.9177 1.09526 21.9755 0.995356C22.0333 0.895456 22.1284 0.822601 22.2399 0.792818C22.3514 0.763034 22.4702 0.778763 22.5701 0.836542C24.5494 1.9971 26.8504 4.66028 28.1699 7.29088C28.2017 7.34125 28.222 7.39798 28.2295 7.45707C28.2369 7.51615 28.2313 7.57615 28.2131 7.63284C28.1948 7.68953 28.1644 7.74153 28.1238 7.78516C28.0833 7.8288 28.0337 7.86302 27.9785 7.88541C27.9197 7.91716 27.8539 7.93394 27.7871 7.93427C27.7076 7.93435 27.6297 7.9123 27.5621 7.87058C27.4945 7.82886 27.4398 7.76913 27.4043 7.69809ZM14.1685 21.6696C14.197 25.7173 18.0048 30.5428 20.6275 32.1024C20.6782 32.1288 20.7227 32.1656 20.7581 32.2103C20.7936 32.255 20.8193 32.3067 20.8335 32.362C20.8477 32.4173 20.8501 32.475 20.8406 32.5313C20.8311 32.5876 20.8098 32.6412 20.7782 32.6888C20.7398 32.7529 20.6855 32.806 20.6206 32.8431C20.5557 32.8802 20.4824 32.9 20.4076 32.9005C20.3314 32.9008 20.2566 32.8796 20.1918 32.8394C17.3939 31.1902 13.5657 26.3688 13.3214 22.0524H0.427619C0.320884 22.042 0.221842 21.9922 0.149783 21.9128C0.0777241 21.8334 0.0378076 21.73 0.0378076 21.6228C0.0378076 21.5155 0.0777241 21.4121 0.149783 21.3327C0.221842 21.2533 0.320884 21.2035 0.427619 21.1931H13.4028C14.2154 18.3452 14.2154 15.3267 13.4028 12.4788H0.427619C0.314208 12.4788 0.205441 12.4337 0.125247 12.3535C0.0450526 12.2734 0 12.1646 0 12.0512C0 11.9378 0.0450526 11.829 0.125247 11.7489C0.205441 11.6687 0.314208 11.6236 0.427619 11.6236H13.3214C13.5657 7.29087 17.4102 2.48576 20.1918 0.836542C20.2917 0.778763 20.4105 0.763034 20.522 0.792818C20.6335 0.822601 20.7286 0.895456 20.7864 0.995356C20.8442 1.09526 20.8599 1.21402 20.8301 1.32551C20.8003 1.43701 20.7275 1.53211 20.6275 1.58989C18.0048 3.12915 14.197 7.95871 14.1685 12.0105C15.1013 15.1626 15.1013 18.5174 14.1685 21.6696ZM42.3547 21.1932H29.355C28.5424 18.3453 28.5424 15.3268 29.355 12.4789H42.3547C42.4681 12.4789 42.5769 12.4338 42.657 12.3536C42.7372 12.2734 42.7823 12.1647 42.7823 12.0513C42.7823 11.9379 42.7372 11.8291 42.657 11.7489C42.5769 11.6688 42.4681 11.6237 42.3547 11.6237H29.0252C28.9325 11.6248 28.8426 11.6559 28.7692 11.7125C28.6957 11.769 28.6426 11.8479 28.6179 11.9373C27.6711 15.1123 27.6711 18.4946 28.6179 21.6697C28.5894 25.7174 24.7816 30.5428 22.1588 32.1025C22.1069 32.1274 22.0608 32.1631 22.0236 32.2072C21.9865 32.2512 21.9591 32.3027 21.9433 32.3581C21.9276 32.4135 21.9237 32.4717 21.9321 32.5287C21.9404 32.5857 21.9608 32.6403 21.9918 32.6889C22.0303 32.753 22.0845 32.8061 22.1494 32.8432C22.2143 32.8803 22.2877 32.9001 22.3624 32.9006C22.4387 32.9009 22.5135 32.8797 22.5783 32.8395C25.3599 31.2107 29.2044 26.3689 29.4487 22.0524H42.3547C42.4614 22.042 42.5605 21.9923 42.6325 21.9129C42.7046 21.8335 42.7445 21.7301 42.7445 21.6228C42.7445 21.5156 42.7046 21.4122 42.6325 21.3328C42.5605 21.2534 42.4614 21.2036 42.3547 21.1932ZM20.9556 3.16858C21.0815 3.08446 21.2295 3.03956 21.3809 3.03956C21.584 3.03956 21.7787 3.12022 21.9223 3.26379C22.0659 3.40736 22.1466 3.60208 22.1466 3.80512C22.1466 3.95654 22.1017 4.10455 22.0175 4.23045C21.9334 4.35634 21.8138 4.45447 21.6739 4.51241C21.534 4.57035 21.3801 4.58551 21.2316 4.55598C21.083 4.52644 20.9466 4.45352 20.8395 4.34646C20.7325 4.23939 20.6595 4.10298 20.63 3.95448C20.6005 3.80597 20.6156 3.65204 20.6736 3.51216C20.7315 3.37227 20.8297 3.2527 20.9556 3.16858Z" fill="#666666"/>
    <path d="M59.0182 14.101C58.9241 13.9736 58.856 13.8289 58.8178 13.6751C58.7796 13.5214 58.7721 13.3616 58.7956 13.205C58.8432 12.8886 59.0145 12.6041 59.2718 12.414C59.5292 12.224 59.8515 12.1439 60.1678 12.1915C60.4842 12.239 60.7687 12.4103 60.9588 12.6677C61.4045 13.2659 61.7529 13.9308 61.991 14.6377C62.2386 15.3712 62.3641 16.1404 62.3626 16.9145C62.3634 17.6867 62.2379 18.4538 61.991 19.1854C61.7529 19.8924 61.4045 20.5573 60.9588 21.1555C60.7687 21.4128 60.4842 21.5841 60.1678 21.6317C59.8515 21.6793 59.5292 21.5992 59.2718 21.4091C59.0145 21.2191 58.8432 20.9346 58.7956 20.6182C58.7481 20.3018 58.8281 19.9795 59.0182 19.7222C59.3127 19.3302 59.5436 18.8943 59.7024 18.4304C59.8712 17.9427 59.9589 17.4306 59.9619 16.9145C59.964 16.4014 59.8823 15.8914 59.7201 15.4045C59.557 14.9354 59.3201 14.4954 59.0182 14.101ZM63.1471 11.8537C64.086 13.3743 64.5804 15.1274 64.5745 16.9145C64.5826 18.6985 64.0923 20.4492 63.1589 21.9695C63.0756 22.1043 63.0197 22.2541 62.9944 22.4105C62.969 22.5669 62.9747 22.7268 63.0111 22.8809C63.0476 23.0351 63.114 23.1806 63.2067 23.3091C63.2993 23.4376 63.4164 23.5466 63.5511 23.6299C63.6859 23.7132 63.8358 23.7691 63.9922 23.7944C64.1486 23.8198 64.3084 23.8141 64.4626 23.7777C64.6168 23.7412 64.7623 23.6748 64.8908 23.5821C65.0193 23.4895 65.1283 23.3724 65.2116 23.2377C66.3811 21.3369 66.9942 19.1463 66.9811 16.9145C66.9949 14.6809 66.3819 12.4881 65.2116 10.5855C65.1283 10.4507 65.0193 10.3337 64.8908 10.241C64.7623 10.1484 64.6168 10.0819 64.4626 10.0455C64.3084 10.0091 64.1486 10.0034 63.9922 10.0288C63.8358 10.0541 63.6859 10.11 63.5511 10.1933C63.4164 10.2765 63.2993 10.3855 63.2067 10.5141C63.114 10.6426 63.0476 10.7881 63.0111 10.9422C62.9747 11.0964 62.969 11.2563 62.9944 11.4127C63.0197 11.569 63.0756 11.7189 63.1589 11.8537H63.1471ZM67.5414 9.58279C68.8447 11.8148 69.5308 14.3534 69.5292 16.9381C69.53 19.5209 68.844 22.0574 67.5414 24.2876C67.4613 24.4243 67.4088 24.5755 67.3871 24.7324C67.3653 24.8894 67.3747 25.0492 67.4147 25.2025C67.4547 25.3559 67.5245 25.4999 67.6201 25.6263C67.7157 25.7527 67.8353 25.859 67.972 25.9391C68.1087 26.0193 68.2599 26.0718 68.4169 26.0935C68.5739 26.1153 68.7336 26.1059 68.887 26.0659C69.0403 26.0259 69.1843 25.9561 69.3107 25.8605C69.4371 25.7649 69.5434 25.6453 69.6236 25.5086C71.1464 22.9116 71.9467 19.9545 71.9417 16.944C71.9517 13.9225 71.1534 10.9533 69.6295 8.34412C69.4652 8.06723 69.1977 7.86693 68.8858 7.78729C68.5738 7.70764 68.243 7.75518 67.9661 7.91944C67.6892 8.08369 67.4889 8.35122 67.4093 8.66316C67.3296 8.9751 67.3772 9.3059 67.5414 9.58279ZM71.9181 7.28241C73.5945 10.2239 74.4729 13.5525 74.4662 16.9381C74.4721 20.3218 73.5937 23.6483 71.9181 26.588C71.8406 26.7255 71.791 26.8769 71.772 27.0335C71.7531 27.1902 71.7652 27.3491 71.8076 27.501C71.8501 27.653 71.9221 27.7952 72.0194 27.9194C72.1168 28.0435 72.2377 28.1473 72.3752 28.2248C72.5127 28.3022 72.6641 28.3519 72.8208 28.3708C72.9774 28.3898 73.1363 28.3777 73.2883 28.3352C73.4403 28.2928 73.5824 28.2208 73.7066 28.1234C73.8308 28.026 73.9345 27.9051 74.012 27.7676C75.8945 24.4627 76.8825 20.7239 76.8786 16.9204C76.8874 13.107 75.8992 9.35749 74.012 6.04374C73.8556 5.76606 73.5952 5.56191 73.2883 5.47618C72.9813 5.39045 72.6529 5.43017 72.3752 5.58661C72.0975 5.74304 71.8934 6.00338 71.8076 6.31034C71.7219 6.6173 71.7616 6.94575 71.9181 7.22342" fill="black"/>
    </svg>
    '''),
    );
  }

  _bandLogo() {
    return Visibility(
      visible: isNetworkImage,
      child: Image.network(
        logo,
        height: Dimensions.heightSize * 1.5,
      ),
    );
  }

  _cardNumber() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          maskString(addSpacesEveryFourChars(cardNumber), 12),
          typographyStyle: TypographyStyle.headlineSmall,
          fontWeight: FontWeight.w500,
        ),
        Sizes.height.v10,
      ],
    );
  }

  _valid() {
    return Row(
      children: [
        TextWidget(
          'VALID\nTHRU',
          typographyStyle: TypographyStyle.labelSmall,
        ),
        Sizes.width.v15,
        TextWidget(
          expiryDate,
          typographyStyle: TypographyStyle.labelLarge,
        ),
      ],
    );
  }

  _cardHolderName() {
    return Column(
      children: [
        Sizes.height.v10,
        TextWidget(
          cardHolderName,
          typographyStyle: TypographyStyle.labelLarge,
        ),
      ],
    );
  }
}
