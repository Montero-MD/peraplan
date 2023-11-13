import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/transactions_buttons.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: Column(
            children: [
              const HeadingSection(),
              SizedBox(height: small),
              BalanceSection(
                username: '',
              ),
              const TransactionsButtons(),
            ],
          ),
        )));
  }
}
