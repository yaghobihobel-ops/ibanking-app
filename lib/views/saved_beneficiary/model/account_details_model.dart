import 'dart:convert';

AccountDetailsModel accountDetailsModelFromJson(String str) =>
    AccountDetailsModel.fromJson(json.decode(str));

String accountDetailsModelToJson(AccountDetailsModel data) =>
    json.encode(data.toJson());

class AccountDetailsModel {
  Message message;
  Data data;
  String type;

  AccountDetailsModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      AccountDetailsModel(
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
  AccountDetails accountDetails;

  Data({
    required this.accountDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountDetails: AccountDetails.fromJson(json["account_details"]),
      );

  Map<String, dynamic> toJson() => {
        "account_details": accountDetails.toJson(),
      };
}

class AccountDetails {
  String name;
  String accountNumber;
  String email;

  AccountDetails({
    required this.name,
    required this.accountNumber,
    required this.email,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) => AccountDetails(
        name: json["name"],
        accountNumber: json["account_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "account_number": accountNumber,
        "email": email,
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
