import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/transactions_buttons.dart';
import 'package:peraplan/components/transactions_section.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String filter = 'All';

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
              const BalanceSection(),
              SizedBox(height: small),
              TransactionsButtons(onFilterChanged: (String newFilter) {
                setState(() {
                  filter = newFilter;
                });
              }),
              AllTransactionsSection(selectedFilter: filter),
            ],
          ),
        ),
      ),
    );
  }
}
