import 'dart:convert';

import 'package:ibanking/base/utils/basic_import.dart';

BeneficiaryMethodModel beneficiaryMethodModelFromJson(String str) =>
    BeneficiaryMethodModel.fromJson(json.decode(str));

String beneficiaryMethodModelToJson(BeneficiaryMethodModel data) =>
    json.encode(data.toJson());

class BeneficiaryMethodModel {
  Message message;
  Data data;
  String type;

  BeneficiaryMethodModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BeneficiaryMethodModel.fromJson(Map<String, dynamic> json) =>
      BeneficiaryMethodModel(
        message: Message.fromJson(json["message"]),
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
  List<MethodModel> methods;

  Data({
    required this.methods,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        methods: List<MethodModel>.from(
            json["methods"].map((x) => MethodModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "methods": List<dynamic>.from(methods.map((x) => x.toJson())),
      };
}

class MethodModel implements DropdownModel {
  String slug;
  String name;

  MethodModel({
    required this.slug,
    required this.name,
  });

  factory MethodModel.fromJson(Map<String, dynamic> json) => MethodModel(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };

  @override
  String get title => name;
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
