import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(
      {super.key, required this.onTap, this.isWhite = false});
  final VoidCallback onTap;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: BackButton(
        color: isWhite ? Colors.white : null,
      ),
      // child: CustomImageWidget(path: 'Assets.icon.back').paddingSymmetric(
      //   horizontal: Dimensions.horizontalSize * 0.5,
      // ),
    );
  }
}
