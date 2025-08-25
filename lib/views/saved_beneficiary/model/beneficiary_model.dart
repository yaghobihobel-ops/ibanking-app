import 'dart:convert';

import '../../money_out/model/money_out_info_model.dart';

BeneficiaryModel beneficiaryModelFromJson(String str) =>
    BeneficiaryModel.fromJson(json.decode(str));

String beneficiaryModelToJson(BeneficiaryModel data) =>
    json.encode(data.toJson());

class BeneficiaryModel {
  Message message;
  Data data;
  String type;

  BeneficiaryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      BeneficiaryModel(
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
  List<Beneficiary> beneficiary;
  ImagePath imagePath;
  Data({
    required this.beneficiary,
    required this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        beneficiary: List<Beneficiary>.from(
            json["beneficiary"].map((x) => Beneficiary.fromJson(x))),
        imagePath: ImagePath.fromJson(json["image_path"]),
      );

  Map<String, dynamic> toJson() => {
        "beneficiary": List<dynamic>.from(beneficiary.map((x) => x.toJson())),
        "image_path": imagePath.toJson(),
      };
}

class Beneficiary {
  int id;
  String beneficiaryType;
  String slug;
  String accountNumber;
  String accountHolderName;
  dynamic email;
  String beneficiarySubtype;
  dynamic bankName;
  dynamic branchName;
  dynamic image;

  Beneficiary({
    required this.id,
    required this.beneficiaryType,
    required this.slug,
    required this.accountNumber,
    required this.accountHolderName,
    this.email,
    required this.beneficiarySubtype,
    this.bankName,
    this.branchName,
    this.image,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        id: json["id"],
        beneficiaryType: json["beneficiary_type"],
        slug: json["slug"],
        accountNumber: json["account_number"],
        accountHolderName: json["account_holder_name"],
        email: json["email"] ?? '',
        beneficiarySubtype: json["beneficiary_subtype"],
        bankName: json["bank_name"] ?? '',
        branchName: json["branch_name"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "beneficiary_type": beneficiaryType,
        "slug": slug,
        "account_number": accountNumber,
        "account_holder_name": accountHolderName,
        "email": email,
        "beneficiary_subtype": beneficiarySubtype,
        "bank_name": bankName,
        "branch_name": branchName,
        "image": image,
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
