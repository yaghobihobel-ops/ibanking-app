import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../model/notification_model.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getNotificationInfo();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late NotificationModel _notificationModel;
  NotificationModel get notificationModel => _notificationModel;

  Future<NotificationModel?> getNotificationInfo() async {
    return RequestProcess().request<NotificationModel>(
      fromJson: NotificationModel.fromJson,
      apiEndpoint: ApiEndpoint.notification,
      isLoading: _isLoading,
      onSuccess: (value) {
        _notificationModel = value!;
      },
    );
  }
}
