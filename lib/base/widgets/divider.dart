import 'package:flutter/material.dart';
import 'package:ibanking/base/utils/basic_import.dart';

class DividerWidget extends StatelessWidget {
  DividerWidget({super.key, this.padding = EdgeInsets.zero});
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: CustomColor.disableColor.withOpacity(.4),
        thickness: 0.5,
      ),
    );
  }
}
