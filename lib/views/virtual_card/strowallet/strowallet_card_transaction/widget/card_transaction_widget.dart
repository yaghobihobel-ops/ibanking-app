import 'package:flutter/material.dart';
import 'package:ibanking/base/utils/basic_import.dart';
import 'package:intl/intl.dart';

import '../../../model/strowallet/strowallet_card_transaction_model.dart';

class CardTransactionWidget extends StatelessWidget {
  const CardTransactionWidget({super.key, required this.data});

  final CardTransaction data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.7,
                vertical: Dimensions.paddingSize * 0.1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                color: Colors.grey[100],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    DateFormat('d').format(data.createdAt),
                    typographyStyle: TypographyStyle.headlineSmall,
                  ),
                  TextWidget(
                    DateFormat('MMM').format(data.createdAt),
                    typographyStyle: TypographyStyle.labelSmall,
                  ),
                ],
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
                      '${'Trx'} ${data.cardId}',
                      typographyStyle: TypographyStyle.bodyLarge,
                      fontWeight: FontWeight.bold,
                    ),
                    Sizes.height.v5,
                    TextWidget(
                      data.status,
                      typographyStyle: TypographyStyle.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
