import 'dart:convert';

BankStatementModel bankStatementModelFromJson(String str) =>
    BankStatementModel.fromJson(json.decode(str));

String bankStatementModelToJson(BankStatementModel data) =>
    json.encode(data.toJson());

class BankStatementModel {
  Message message;
  Data data;
  String type;

  BankStatementModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BankStatementModel.fromJson(Map<String, dynamic> json) =>
      BankStatementModel(
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
  List<Transaction> transactions;

  Data({
    required this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Transaction {
  String trxId;
  String transactionType;
  String requestCurrency;
  int requestAmount;
  double totalCharge;
  double payableAmount;
  String type;
  String status;
  DateTime createdAt;

  Transaction({
    required this.trxId,
    required this.transactionType,
    required this.requestCurrency,
    required this.requestAmount,
    required this.totalCharge,
    required this.payableAmount,
    required this.type,
    required this.status,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        trxId: json["trx_id"],
        transactionType: json["transaction_type"],
        requestCurrency: json["request_currency"],
        requestAmount: json["request_amount"],
        totalCharge: json["total_charge"]?.toDouble(),
        payableAmount: json["payable_amount"]?.toDouble(),
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "transaction_type": transactionType,
        "request_currency": requestCurrency,
        "request_amount": requestAmount,
        "total_charge": totalCharge,
        "payable_amount": payableAmount,
        "type": type,
        "status": status,
        "created_at": createdAt.toIso8601String(),
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
