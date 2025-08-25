import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibanking/views/money_out/controller/money_out_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../model/money_out_info_model.dart';

class MoneyOutPaymentGateway extends StatelessWidget {
  MoneyOutPaymentGateway({super.key});
  final controller = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        children: [
          _paymentGateway(),
        ],
      ),
    );
  }

  _paymentGateway() {
    return Obx(
      () => Column(
        children: [
          CustomDropDown<PaymentGateway>(
            inputBoxHeight: Dimensions.inputBoxHeight * 0.95,
            fieldPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSize * 0.7,
              vertical: Dimensions.verticalSize * 0.4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
              color: CustomColor.whiteColor,
            ),
            itemsList: controller.paymentGatewayList,
            label: Strings.selectPaymentGateway,
            selectMethod: controller.selectPaymentGateway.value!.name.obs,
            onChanged: (v) {
              controller.selectPaymentGateway.value = v;
              controller.updateExchangeRateWithLimit();
              controller.getFee(
                rate: v!.rate,
              );
            },
          ),
        ],
      ),
    );
  }
}
