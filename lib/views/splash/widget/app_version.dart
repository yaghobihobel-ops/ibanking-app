import 'package:flutter/material.dart';
import 'package:ibanking/base/utils/basic_import.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          Strings.appName,
          fontWeight: FontWeight.bold,
          typographyStyle: TypographyStyle.titleLarge,
        ),
      ],
    );
  }
}
