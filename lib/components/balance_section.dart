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
  late Box<dynamic> _mybox;

  late PeraPlanDB _peraPlanDB;

  @override
  void initState() {
    super.initState();
    _mybox = Hive.box('peraplanDB');
    _peraPlanDB = PeraPlanDB();
    _peraPlanDB.loadPeraInTransactions();
    _peraPlanDB.loadPeraOutTransactions();
  }

  double calculateBalance() {
    double peraInTotal = _peraPlanDB.peraInTransactions
        .map<double>((transaction) => transaction[0] as double)
        .fold(0, (prev, amount) => prev + amount);

    double peraOutTotal = _peraPlanDB.peraOutTransactions
        .map<double>((transaction) => transaction[0] as double)
        .fold(0, (prev, amount) => prev + amount);

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
                  offset: const Offset(0, 4)),
            ],
          ),
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
