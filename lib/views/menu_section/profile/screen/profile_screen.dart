import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/profile_controller.dart';
import '../widget/profile_image_picker.dart';
import '../widget/profle_input_widget.dart';

part 'profile_mobile_screen.dart';
part 'profile_tablet_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ProfileMobileScreen(),
      tablet: ProfileTabletScreen(),
    );
  }
}
