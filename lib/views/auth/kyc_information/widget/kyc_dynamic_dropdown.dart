import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../../base/widgets/country_drop_down.dart';

class KycDynamicDropDown extends StatelessWidget {
  final RxString selectMethod;
  final String label;
  final List<String> itemsList;
  final void Function(String?)? onChanged;

  const KycDynamicDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize),
      child: Column(
        children: [
          CountryDropDown(
            itemsList: itemsList,
            subtitle: label,
            selectMethod: selectMethod,
            onChanged: onChanged,
          ),
          Sizes.height.betweenInputBox,
        ],
      ),
    );
  }
}
