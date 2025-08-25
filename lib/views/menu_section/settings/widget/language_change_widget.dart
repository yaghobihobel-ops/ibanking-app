import 'package:flutter/material.dart';

import '../../../../base/utils/basic_import.dart';
import '../../drawer_menu/widget/card_type_widget.dart';
import 'language_drop_down.dart';

class LanguageChangeWidget extends StatelessWidget {
  const LanguageChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardTypeWidget(
      title: Strings.language,
      description: '',
      icon: Icons.g_translate,
      onTap: () {},
      child: ChangeLanguageWidget(),
    );
  }
}
