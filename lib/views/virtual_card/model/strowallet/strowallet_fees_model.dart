import 'dart:convert';

StrowalletFeesModel strowalletFeesModelFromJson(String str) =>
    StrowalletFeesModel.fromJson(json.decode(str));

String strowalletFeesModelToJson(StrowalletFeesModel data) =>
    json.encode(data.toJson());

class StrowalletFeesModel {
  Message message;
  StrowalletFeesModelData data;
  String type;

  StrowalletFeesModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory StrowalletFeesModel.fromJson(Map<String, dynamic> json) =>
      StrowalletFeesModel(
        message: Message.fromJson(json["message"]),
        data: StrowalletFeesModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class StrowalletFeesModelData {
  DataData data;

  StrowalletFeesModelData({
    required this.data,
  });

  factory StrowalletFeesModelData.fromJson(Map<String, dynamic> json) =>
      StrowalletFeesModelData(
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataData {
  String baseCurr;
  CardCharge cardCharge;

  DataData({
    required this.baseCurr,
    required this.cardCharge,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        baseCurr: json["base_curr"],
        cardCharge: CardCharge.fromJson(json["cardCharge"]),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "cardCharge": cardCharge.toJson(),
      };
}

class CardCharge {
  int id;
  String slug;
  String title;
  dynamic fixedCharge;
  dynamic percentCharge;
  dynamic minLimit;
  dynamic maxLimit;

  CardCharge({
    required this.id,
    required this.slug,
    required this.title,
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
  });

  factory CardCharge.fromJson(Map<String, dynamic> json) => CardCharge(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        percentCharge: json["percent_charge"]?.toDouble() ?? 0.0,
        minLimit: json["min_limit"]?.toDouble() ?? 0.0,
        maxLimit: json["max_limit"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "min_limit": minLimit,
        "max_limit": maxLimit,
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
