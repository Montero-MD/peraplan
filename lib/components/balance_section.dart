// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:hive/hive.dart';
import 'package:peraplan/data/database.dart';

class BalanceSection extends StatefulWidget {
  const BalanceSection({Key? key}) : super(key: key);

  @override
  _DynamicBalanceDisplayState createState() => _DynamicBalanceDisplayState();
}

class _DynamicBalanceDisplayState extends State<BalanceSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RoundedTextBackground(),
        SizedBox(height: small),
      ],
    );
  }
}

class RoundedTextBackground extends StatefulWidget {
  const RoundedTextBackground({super.key});

  @override
  State<RoundedTextBackground> createState() => _RoundedTextBackgroundState();
}

class _RoundedTextBackgroundState extends State<RoundedTextBackground> {
  late Box<Transaction> _transactionBox;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  double calculateBalance() {
    double peraInTotal = 0.0;
    double peraOutTotal = 0.0;

    for (int i = 0; i < _transactionBox.length; i++) {
      final transaction = _transactionBox.getAt(i);

      if (transaction is PeraIn) {
        peraInTotal += transaction.amount;
      } else if (transaction is PeraOut) {
        peraOutTotal += transaction.amount;
      }
    }

    return peraInTotal - peraOutTotal;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double balanceAmount = calculateBalance();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Your ', style: lNormal),
            TextSpan(
              text: 'Balance',
              style: lBold,
            ),
          ],
        )),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [hlblue, text]),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: dgray,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ]),
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Text(
                '₱$balanceAmount',
                style: balAmt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
