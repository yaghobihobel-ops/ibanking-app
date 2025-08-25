import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:ibanking/views/add_money/controller/add_money_controller.dart';

import '../../../routes/routes.dart';
import '../../congratulations/model/congratulations_model.dart';
import '../../congratulations/screen/congratulations_screen.dart';

class WebPaymentScreen extends StatelessWidget {
  WebPaymentScreen({super.key});
  final controller = Get.put(AddMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(''),
      body: Obx(
        () => controller.isLoading ? const Loader() : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final paymentUrl = controller.addMoneyGatewayModel.data.redirectUrl;

    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(paymentUrl)),
      onWebViewCreated: (InAppWebViewController inAppWebViewController) {},
      onProgressChanged:
          (InAppWebViewController inAppWebViewController, int progress) {},
      onLoadStop: (InAppWebViewController inAppWebViewController, url) async {
        if (url != null) {
          String? pageContent = await inAppWebViewController.evaluateJavascript(
            source: "document.body.innerText",
          );

          if (pageContent != null && pageContent.isNotEmpty) {
            try {
              Map<String, dynamic> parsedJson = json.decode(pageContent);
              if (parsedJson['type'] == 'success') {
                Congratulation congratulation = Congratulation(
                  details: parsedJson['message']['success'].first,
                  route: Routes.navigation,
                  buttonText: Strings.backToHome,
                  type: Strings.addMoney,
                );
                Get.to(
                  () => CongratulationsScreen(),
                  arguments: congratulation,
                );
              } else if (parsedJson['type'] == 'error') {
                Get.close(1);
                CustomSnackBar.error(
                  parsedJson['message']['error'].first,
                );
              }
            } catch (e) {
              print("Error parsing JSON: $e");
            }
          }
        }
      },
    );
  }
}
