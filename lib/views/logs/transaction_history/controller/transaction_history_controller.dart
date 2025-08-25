import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../base/utils/basic_import.dart';
import '../../model/transaction_history_model.dart';

class TransactionHistoryController extends GetxController {
  RxString expandedTransactionId = ''.obs;
  @override
  void onInit() {
    getTransactionHistory();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late TransactionHistoryModel _transactionHistoryModel;
  TransactionHistoryModel get transactionHistoryModel =>
      _transactionHistoryModel;

  Future<TransactionHistoryModel?> getTransactionHistory() async {
    return RequestProcess().request<TransactionHistoryModel>(
      fromJson: TransactionHistoryModel.fromJson,
      apiEndpoint: ApiEndpoint.transactionLog,
      isLoading: _isLoading,
      onSuccess: (value) {
        _transactionHistoryModel = value!;
      },
    );
  }

  Future<bool> requestPermissions() async {
    Map<Permission, PermissionStatus> status;
    if (Platform.isAndroid) {
      status = await [Permission.manageExternalStorage].request();
      debugPrint("Status $status");
    } else {
      status = await [Permission.storage].request();
    }
    var allAccept = true;
    status.forEach((permission, status) {
      if (status != PermissionStatus.granted) {
        allAccept = false;
      }
    });
    if (allAccept) {
      debugPrint("working fine");
      return true;
    }
    return false;
  }

  RxBool isDownloading = false.obs;
  RxString progress = "0%".obs;

  Future<void> downloadStatement(
      {required String url, required String fileName}) async {
    isDownloading.value = true;
    progress.value = "0%";
    try {
      final directory = await getExternalStorageDirectory();
      final filePath = "${directory?.path}/$fileName";
      Dio dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress.value =
                "${((received / total) * 100).toStringAsFixed(0)}%";
          }
        },
      );

      CustomSnackBar.success(
        message: "File downloaded to $filePath",
        title: Strings.success,
        onTap: (_) {
          OpenFile.open(filePath);
        },
      );

      isDownloading.value = false;
      progress.value = "Download Complete";
    } catch (e) {
      isDownloading.value = false;
      progress.value = "Error: $e";
      Get.snackbar("Error", "Failed to download file: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
