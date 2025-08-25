import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/utils/basic_import.dart';
import '../model/bank_statement_model.dart';
import '../model/filter_type_model.dart';
import '../model/status_type_model.dart';

class BankStatementController extends GetxController {
  final trxIdController = TextEditingController();
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  RxString selectDate = Strings.selectDate.obs;
  RxString filterType = "All".obs;
  RxString filterTypeSlug = "".obs;
  RxString statusType = ''.obs;
  RxInt statusTypeId = 0.obs;

  final List<Transaction> transactionList = [];

  // Filter Data
  final List<FilterTypeModel> filterTypeList = [
    FilterTypeModel(title: "All", name: "All"),
    FilterTypeModel(title: "Add Money", name: "ADD-MONEY"),
    FilterTypeModel(title: "Money Out", name: "MONEY-OUT"),
    FilterTypeModel(
        title: "Add Subtract Balance", name: "ADD-SUBTRACT-BALANCE"),
    FilterTypeModel(title: "Fund Transfer", name: "FUND-TRANSFER"),
    FilterTypeModel(title: "Own Bank Transfer", name: "OWN-BANK-TRANSFER"),
    FilterTypeModel(title: "Other Bank Transfer", name: "OTHER-BANK-TRANSFER"),
  ];

  final List<StatusTypeModel> statusList = [
    StatusTypeModel(id: 1, name: "Success"),
    StatusTypeModel(id: 2, name: "Pending"),
    StatusTypeModel(id: 3, name: "Hold"),
    StatusTypeModel(id: 4, name: "Rejected"),
  ];

  final _isSubmitLoading = false.obs;
  bool get isSubmitLoading => _isSubmitLoading.value;

  late BankStatementModel _bankStatementModel;
  BankStatementModel get bankStatementModel => _bankStatementModel;

  Future<BankStatementModel?> getBankStatement() async {
    return RequestProcess().request<BankStatementModel>(
      fromJson: BankStatementModel.fromJson,
      apiEndpoint: ApiEndpoint.bankStatement,
      isLoading: _isSubmitLoading,
      queryParams: {
        'trx_id': trxIdController.text,
        'from_time':
            '${startDate.value?.year}-${startDate.value?.month}-${startDate.value?.day}',
        'to_time':
            '${endDate.value?.year}-${endDate.value?.month}-${endDate.value?.day}',
        'type': filterTypeSlug.value,
        'status': statusTypeId.value.toString(),
      },
      onSuccess: (value) {
        _bankStatementModel = value!;
        _bankStatementModel.data.transactions.forEach((v) {
          transactionList.add(
            Transaction(
              trxId: v.trxId,
              type: v.type,
              requestCurrency: v.requestCurrency,
              requestAmount: v.requestAmount,
              totalCharge: v.totalCharge,
              status: v.status,
              createdAt: v.createdAt,
              transactionType: v.transactionType,
              payableAmount: v.payableAmount,
            ),
          );
        });
      },
    );
  }
}
