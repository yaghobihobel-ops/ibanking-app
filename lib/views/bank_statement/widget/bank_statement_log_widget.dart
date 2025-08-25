import 'package:flutter/material.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:intl/intl.dart';

import '../../../../base/widgets/divider.dart';
import '../../../../base/widgets/double_side_text_widget.dart';
import '../model/bank_statement_model.dart';

class BankStatementLogWidget extends StatefulWidget {
  const BankStatementLogWidget({super.key, required this.transaction});
  final Transaction transaction;

  @override
  State<BankStatementLogWidget> createState() => _BankStatementLogWidgetState();
}

class _BankStatementLogWidgetState extends State<BankStatementLogWidget> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    var iconPath = widget.transaction.type == 'OTHER-BANK-TRANSFER'
        ? Icons.account_balance_wallet_rounded
        : widget.transaction.type == 'ADD-MONEY'
            ? Icons.add
            : widget.transaction.type == 'MONEY-OUT'
                ? Icons.money
                : Icons.payment_rounded;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _showDetails = !_showDetails;
            });
          },
          child: Card(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      iconPath,
                      color: CustomColor.disableColor,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSize * 0.3,
                      ),
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          TextWidget(
                            widget.transaction.type,
                            typographyStyle: TypographyStyle.bodyMedium,
                            fontWeight: FontWeight.bold,
                          ),
                          Sizes.height.v5,
                          TextWidget(
                            widget.transaction.trxId,
                            typographyStyle: TypographyStyle.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextWidget(
                      widget.transaction.requestAmount.toStringAsFixed(2) +
                          ' ' +
                          widget.transaction.requestCurrency,
                      typographyStyle: TypographyStyle.bodySmall,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_showDetails) _buildCard(context),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    bool isSend = widget.transaction.type == 'Transfer Money';
    // widget.transaction.attribute == 'SEND';
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.defaultHorizontalSize,
          right: Dimensions.defaultHorizontalSize,
          top: Dimensions.verticalSize * 0.7,
          bottom: Dimensions.verticalSize * 0.7,
        ),
        child: Column(
          children: [
            _virtualCardInfo(),
            if (widget.transaction.type != 'VIRTUAL-CARD') ...[
              _buildInfoRow(
                  Strings.date,
                  DateFormat('d MMM yyyy')
                      .format(widget.transaction.createdAt)),
              _buildDivider(),
              _buildInfoRow(Strings.transactionId, widget.transaction.trxId),
              _buildDivider(),
              _buildInfoRow(
                widget.transaction.type == 'Transfer Money'
                    ? isSend
                        ? Strings.transferAmount
                        : Strings.receiveAmount
                    : Strings.requestAmount,
                widget.transaction.requestAmount.toStringAsFixed(2) +
                    ' ' +
                    widget.transaction.requestCurrency,
              ),
              _buildDivider(),
              _buildInfoRow(
                Strings.charge,
                widget.transaction.totalCharge.toStringAsFixed(2) +
                    ' ' +
                    widget.transaction.requestCurrency,
              ),
              _buildDivider(),
              // _buildInfoRow(
              //   Strings.totalPayableAmount,
              //   widget.transaction.totalPayable!.toStringAsFixed(2) +
              //       ' ' +
              //       widget.transaction.requestCurrency,
              // ),
              _buildDivider(),
              _accountHolderInfo(),
              _addMoneyInfo(),
              _buildInfoRowStatus(),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return DividerWidget(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.2,
      ),
    );
  }

  Widget _buildInfoRow(String key, String value) {
    return DoubleSideTextWidget(
      keys: key,
      value: value,
      valueStyle: TypographyStyle.bodyMedium,
    );
  }

  _buildInfoRowStatus() {
    return widget.transaction.status == 'Success'
        ? DoubleSideTextWidget(
            keys: Strings.status,
            value: Strings.success,
            valueStyle: TypographyStyle.bodyMedium,
            rightWidget: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize * 0.4,
                vertical: Dimensions.verticalSize * 0.15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.6),
                color: const Color(0xFFE9FFF1),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: Dimensions.iconSizeDefault,
                  ),
                  Sizes.width.v5,
                  TextWidget(
                    Strings.success,
                    typographyStyle: TypographyStyle.labelMedium,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          )
        : widget.transaction.status == 'Pending'
            ? DoubleSideTextWidget(
                keys: Strings.status,
                value: Strings.success,
                valueStyle: TypographyStyle.bodyMedium,
                rightWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.4,
                    vertical: Dimensions.verticalSize * 0.15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.6),
                    color: const Color(0xFFFFE9DA),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        color: CustomColor.pending,
                        size: Dimensions.iconSizeDefault,
                      ),
                      Sizes.width.v5,
                      TextWidget(
                        Strings.pending,
                        typographyStyle: TypographyStyle.labelMedium,
                        color: CustomColor.pending,
                      ),
                    ],
                  ),
                ),
              )
            : DoubleSideTextWidget(
                keys: Strings.status,
                value: Strings.success,
                valueStyle: TypographyStyle.bodyMedium,
                rightWidget: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.4,
                    vertical: Dimensions.verticalSize * 0.15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.6),
                    color: const Color(0xFFFFEBE9),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.block_outlined,
                        color: CustomColor.rejected,
                        size: Dimensions.iconSizeDefault,
                      ),
                      Sizes.width.v5,
                      TextWidget(
                        Strings.success,
                        typographyStyle: TypographyStyle.labelMedium,
                        color: CustomColor.rejected,
                      ),
                    ],
                  ),
                ),
              );
  }

  _accountHolderInfo() {
    return widget.transaction.type == 'OTHER-BANK-TRANSFER'
        ? Column(
            crossAxisAlignment: crossStart,
            children: [
              // _buildInfoRow(
              //   Strings.accountHolderNumber,
              //   widget.transaction.accountNumber ?? '',
              // ),
              _buildDivider(),
              // _buildInfoRow(
              //   Strings.accountHolderName,
              //   widget.transaction.accountHolderName ?? '',
              // ),
              _buildDivider(),
              // _buildInfoRow(
              //   Strings.remarks,
              //   widget.transaction.remark ?? 'N/A',
              // ),
              _buildDivider(),
            ],
          )
        : SizedBox.shrink();
  }

  _virtualCardInfo() {
    return widget.transaction.type == 'VIRTUAL-CARD'
        ? Column(
            crossAxisAlignment: crossStart,
            children: [
              _buildInfoRow(
                Strings.date,
                DateFormat('d MMM yyyy').format(widget.transaction.createdAt),
              ),
              _buildDivider(),
              _buildInfoRow(Strings.transactionId, widget.transaction.trxId),
              _buildDivider(),
              _buildInfoRow(
                Strings.requestAmount,
                widget.transaction.requestAmount.toStringAsFixed(2) +
                    ' ' +
                    widget.transaction.requestCurrency,
              ),
              _buildDivider(),
              _buildInfoRow(
                Strings.charge,
                widget.transaction.totalCharge.toStringAsFixed(2) +
                    ' ' +
                    widget.transaction.requestCurrency,
              ),
              _buildDivider(),
              _buildInfoRowStatus(),
            ],
          )
        : SizedBox.shrink();
  }

  _addMoneyInfo() {
    return widget.transaction.type == 'ADD-MONEY'
        ? Column(
            crossAxisAlignment: crossStart,
            children: [
              _buildInfoRow(
                Strings.willGet,
                widget.transaction.requestAmount.toStringAsFixed(2) +
                    ' ' +
                    widget.transaction.requestCurrency,
              ),
              _buildDivider(),
              // _buildInfoRow(
              //   Strings.gatewayName,
              //   widget.transaction.gateway ?? '',
              // ),
              _buildDivider(),
            ],
          )
        : SizedBox.shrink();
  }
}
