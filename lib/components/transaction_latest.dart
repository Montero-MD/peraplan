// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';

class Transaction_Title extends StatelessWidget {
  const Transaction_Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Latest ', style: transacBold),
              TextSpan(
                text: 'Transactions',
                style: transacNormal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
