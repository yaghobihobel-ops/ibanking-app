import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModelMessage message;
  Data data;
  String type;

  NotificationModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: NotificationModelMessage.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class Data {
  List<NotificationList> notification;

  Data({
    required this.notification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notification: List<NotificationList>.from(
            json["notification"].map((x) => NotificationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notification": List<dynamic>.from(notification.map((x) => x.toJson())),
      };
}

class NotificationList {
  int id;
  String type;
  NotificationMessage message;
  DateTime createdAt;

  NotificationList({
    required this.id,
    required this.type,
    required this.message,
    required this.createdAt,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json["id"],
        type: json["type"],
        message: NotificationMessage.fromJson(json["message"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "message": message.toJson(),
        "created_at": createdAt.toIso8601String(),
      };
}

class NotificationMessage {
  String title;
  dynamic gateway;
  String currency;
  int amount;
  String message;

  NotificationMessage({
    required this.title,
    required this.gateway,
    required this.currency,
    required this.amount,
    required this.message,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) =>
      NotificationMessage(
        title: json["title"],
        gateway: json["gateway"],
        currency: json["currency"],
        amount: json["amount"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "gateway": gateway,
        "currency": currency,
        "amount": amount,
        "message": message,
      };
}

class NotificationModelMessage {
  List<String> success;

  NotificationModelMessage({
    required this.success,
  });

  factory NotificationModelMessage.fromJson(Map<String, dynamic> json) =>
      NotificationModelMessage(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
