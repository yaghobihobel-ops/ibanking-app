part of 'notification_screen.dart';

class NotificationMobileScreen extends GetView<NotificationController> {
  const NotificationMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.notifications),
      body: Obx(
        () => controller.isLoading ? Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(
          left: Dimensions.defaultHorizontalSize * 0.8,
          right: Dimensions.defaultHorizontalSize * 0.8,
          top: Dimensions.verticalSize * 0.3,
        ),
        children: List.generate(
          controller.notificationModel.data.notification.length,
          (index) {
            return LogWidget(
              notification:
                  controller.notificationModel.data.notification[index],
            );
          },
        ),
      ),
    );
  }
}
