import 'dart:convert';

AddMoneyGatewayModel addMoneyGatewayModelFromJson(String str) =>
    AddMoneyGatewayModel.fromJson(json.decode(str));

String addMoneyGatewayModelToJson(AddMoneyGatewayModel data) =>
    json.encode(data.toJson());

class AddMoneyGatewayModel {
  Message message;
  Data data;

  AddMoneyGatewayModel({
    required this.message,
    required this.data,
  });

  factory AddMoneyGatewayModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyGatewayModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String redirectUrl;

  Data({
    required this.redirectUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "redirect_url": redirectUrl,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
