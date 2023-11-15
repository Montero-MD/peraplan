// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/pera_buttons.dart';
import 'package:peraplan/components/quick_actions.dart';
import 'package:peraplan/components/transactions_section.dart';
import 'package:peraplan/components/heading_section.dart';
import 'package:peraplan/utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              SizedBox(height: xsmall),
              const BalanceSection(),
              const QuickActions(),
              SizedBox(height: small),
              const TransactionsSection()
            ],
          ),
        )));
  }
}
