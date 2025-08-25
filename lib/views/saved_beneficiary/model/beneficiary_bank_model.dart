import 'dart:convert';

import 'package:ibanking/base/utils/basic_import.dart';

BeneficiaryBankModel beneficiaryBankModelFromJson(String str) =>
    BeneficiaryBankModel.fromJson(json.decode(str));

String beneficiaryBankModelToJson(BeneficiaryBankModel data) =>
    json.encode(data.toJson());

class BeneficiaryBankModel {
  Message message;
  Data data;
  String type;

  BeneficiaryBankModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BeneficiaryBankModel.fromJson(Map<String, dynamic> json) =>
      BeneficiaryBankModel(
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
  List<BankList> bankList;

  Data({
    required this.bankList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bankList: List<BankList>.from(
            json["bank_list"].map((x) => BankList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bank_list": List<dynamic>.from(bankList.map((x) => x.toJson())),
      };
}

class BankList implements DropdownModel {
  int bankId;
  String bankName;
  List<Branch> branches;

  BankList({
    required this.bankId,
    required this.bankName,
    required this.branches,
  });

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
        bankId: json["bank_id"],
        bankName: json["bank_name"],
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "bank_name": bankName,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };

  @override
  String get title => bankName;
}

class Branch implements DropdownModel {
  int id;
  String name;

  Branch({
    required this.id,
    required this.name,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
