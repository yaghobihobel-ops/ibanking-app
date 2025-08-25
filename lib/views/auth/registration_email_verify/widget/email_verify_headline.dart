import 'package:flutter/material.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/base/widgets/title_sub_title_widget.dart';

class EmailVerifyHeadlineWidget extends StatelessWidget {
  const EmailVerifyHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.413,
        bottom: Dimensions.verticalSize * 0.6,
      ),
      child: const TitleSubTitleWidget(
        title: Strings.pleaseEnterTheCode,
        subTitle: Strings.enterTheOtpVerification,
      ),
    );
  }
}
