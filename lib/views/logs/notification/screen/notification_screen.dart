import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/dashboard/widget/log_widget.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/notification_controller.dart';

part 'notification_mobile_screen.dart';
part 'notification_tablet_screen.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: NotificationMobileScreen(),
      tablet: NotificationTabletScreen(),
    );
  }
}
