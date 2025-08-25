import 'dart:convert';

StrowalletCreatePageFieldModel strowalletCreatePageFieldModelFromJson(
        String str) =>
    StrowalletCreatePageFieldModel.fromJson(json.decode(str));

String strowalletCreatePageFieldModelToJson(
        StrowalletCreatePageFieldModel data) =>
    json.encode(data.toJson());

class StrowalletCreatePageFieldModel {
  Message message;
  StrowalletCreatePageFieldModelData data;
  String type;

  StrowalletCreatePageFieldModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory StrowalletCreatePageFieldModel.fromJson(Map<String, dynamic> json) =>
      StrowalletCreatePageFieldModel(
        message: Message.fromJson(json["message"]),
        data: StrowalletCreatePageFieldModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class StrowalletCreatePageFieldModelData {
  DataData data;

  StrowalletCreatePageFieldModelData({
    required this.data,
  });

  factory StrowalletCreatePageFieldModelData.fromJson(
          Map<String, dynamic> json) =>
      StrowalletCreatePageFieldModelData(
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataData {
  bool customerExistStatus;
  List<CreateField> customerCreateFields;
  CustomerExist customerExist;
  List<String> customerKycStatusCanBe;
  String customerKycStatus;
  String customerLowKycText;
  List<CreateField> cardCreateFields;

  DataData({
    required this.customerExistStatus,
    required this.customerCreateFields,
    required this.customerExist,
    required this.customerKycStatusCanBe,
    required this.customerKycStatus,
    required this.customerLowKycText,
    required this.cardCreateFields,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        customerExistStatus: json["customer_exist_status"],
        customerCreateFields: List<CreateField>.from(
            json["customer_create_fields"].map((x) => CreateField.fromJson(x))),
        customerExist: CustomerExist.fromJson(json["customer_exist"]),
        customerKycStatusCanBe:
            List<String>.from(json["customer_kyc_status_can_be"].map((x) => x)),
        customerKycStatus: json["customer_kyc_status"],
        customerLowKycText: json["customer_low_kyc_text"],
        cardCreateFields: List<CreateField>.from(
            json["card_create_fields"].map((x) => CreateField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_exist_status": customerExistStatus,
        "customer_create_fields":
            List<dynamic>.from(customerCreateFields.map((x) => x.toJson())),
        "customer_exist": customerExist.toJson(),
        "customer_kyc_status_can_be":
            List<dynamic>.from(customerKycStatusCanBe.map((x) => x)),
        "customer_kyc_status": customerKycStatus,
        "customer_low_kyc_text": customerLowKycText,
        "card_create_fields":
            List<dynamic>.from(cardCreateFields.map((x) => x.toJson())),
      };
}

class CreateField {
  int id;
  String fieldName;
  String labelName;
  String siteLabel;
  String type;
  bool required;

  CreateField({
    required this.id,
    required this.fieldName,
    required this.labelName,
    required this.siteLabel,
    required this.type,
    required this.required,
  });

  factory CreateField.fromJson(Map<String, dynamic> json) => CreateField(
        id: json["id"],
        fieldName: json["field_name"],
        labelName: json["label_name"],
        siteLabel: json["site_label"],
        type: json["type"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_name": fieldName,
        "label_name": labelName,
        "site_label": siteLabel,
        "type": type,
        "required": required,
      };
}

class CustomerExist {
  String customerEmail;
  String firstName;
  String lastName;
  String phoneNumber;
  String city;
  String state;
  String country;
  String line1;
  String zipCode;
  String houseNumber;
  String idNumber;
  String idType;
  String idImage;
  String userPhoto;
  String customerId;
  DateTime dateOfBirth;
  String status;

  CustomerExist({
    required this.customerEmail,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.city,
    required this.state,
    required this.country,
    required this.line1,
    required this.zipCode,
    required this.houseNumber,
    required this.idNumber,
    required this.idType,
    required this.idImage,
    required this.userPhoto,
    required this.customerId,
    required this.dateOfBirth,
    required this.status,
  });

  factory CustomerExist.fromJson(Map<String, dynamic> json) => CustomerExist(
        customerEmail: json["customerEmail"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        line1: json["line1"],
        zipCode: json["zipCode"],
        houseNumber: json["houseNumber"],
        idNumber: json["idNumber"],
        idType: json["idType"],
        idImage: json["idImage"],
        userPhoto: json["userPhoto"],
        customerId: json["customerId"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"] == ''
            ? DateTime.now().toString()
            : json["dateOfBirth"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "customerEmail": customerEmail,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "city": city,
        "state": state,
        "country": country,
        "line1": line1,
        "zipCode": zipCode,
        "houseNumber": houseNumber,
        "idNumber": idNumber,
        "idType": idType,
        "idImage": idImage,
        "userPhoto": userPhoto,
        "customerId": customerId,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "status": status,
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
