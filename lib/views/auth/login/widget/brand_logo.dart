import 'package:flutter/material.dart';
import 'package:ibanking/base/api/services/basic_services.dart';
import 'package:ibanking/base/utils/dimensions.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo(
      {super.key,
      this.isDarkLogo = false,
      this.scale,
      this.edgeInsets,
      this.height});
  final bool isDarkLogo;
  final EdgeInsets? edgeInsets;
  final double? scale;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Container(
        margin: edgeInsets ?? EdgeInsets.only(bottom: Dimensions.verticalSize),
        child: Image.network(
          BasicServices.appBasicLogoWhite.value,
          scale: scale ?? 1,
          color: isDarkLogo ? Colors.white : null,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
