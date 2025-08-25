import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) =>
    TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) =>
    json.encode(data.toJson());

class TransactionHistoryModel {
  Message message;
  Data data;
  String type;

  TransactionHistoryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
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
  String type;
  String trxId;
  String? gateway;
  String? gatewayCurrency;
  int requestAmount;
  String requestCurrency;
  double? exchangeRate;
  double totalCharge;
  double? totalPayable;
  double? receiveAmount;
  String status;
  DateTime createdAt;
  String? remark;
  String? accountNumber;
  String? accountHolderName;
  String? bankName;
  String? branchName;
  String? downloadUrl;

  Transaction({
    required this.type,
    required this.trxId,
    this.gateway,
    this.gatewayCurrency,
    required this.requestAmount,
    required this.requestCurrency,
    this.exchangeRate,
    required this.totalCharge,
    this.totalPayable,
    this.receiveAmount,
    required this.status,
    required this.createdAt,
    this.remark,
    this.accountNumber,
    this.accountHolderName,
    this.bankName,
    this.branchName,
    this.downloadUrl,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        type: json["type"],
        trxId: json["trx_id"],
        gateway: json["gateway"],
        gatewayCurrency: json["gateway_currency"],
        requestAmount: json["request_amount"],
        requestCurrency: json["request_currency"],
        exchangeRate: json["exchange_rate"]?.toDouble() ?? 0.0,
        totalCharge: json["total_charge"]?.toDouble() ?? 0.0,
        totalPayable: json["total_payable"]?.toDouble() ?? 0.0,
        receiveAmount: json["receive_amount"]?.toDouble() ?? 0.0,
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        remark: json["remark"],
        accountNumber: json["account_number"],
        accountHolderName: json["account_holder_name"],
        bankName: json["bank_name"],
        branchName: json["branch_name"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "trx_id": trxId,
        "gateway": gateway,
        "gateway_currency": gatewayCurrency,
        "request_amount": requestAmount,
        "request_currency": requestCurrency,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "total_payable": totalPayable,
        "receive_amount": receiveAmount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "remark": remark,
        "account_number": accountNumber,
        "account_holder_name": accountHolderName,
        "bank_name": bankName,
        "branch_name": branchName,
        "download_url": downloadUrl,
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
