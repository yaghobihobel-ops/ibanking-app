import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/two_fa_controller.dart';

part 'two_fa_mobile_screen.dart';
part 'two_fa_tablet_screen.dart';

class TwoFaScreen extends GetView<TwoFaController> {
  const TwoFaScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: TwoFaMobileScreen(),
      tablet: TwoFaTabletScreen(),
    );
  }
}
