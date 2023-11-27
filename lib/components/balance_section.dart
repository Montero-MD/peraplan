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

  bool _showBalance = true;

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

String generateMaskedBalance(double amount) {
  return '*' * amount.toString().length;
}

@override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double balanceAmount = calculateBalance();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Your ',
            style: lNormal,
          ),
          Text(
            'Balance',
            style: lBold,
          ),
          const SizedBox(width:1), 
          IconButton(
            icon: Icon(
              _showBalance ? Icons.visibility : Icons.visibility_off,
              size: 20,
              color: Colors.black.withOpacity(0.62),
            ),
            onPressed: () {
              setState(() {
                _showBalance = !_showBalance;
              });
            },
          ),
        ],
      ),

      GestureDetector(
        onTap: () {
          setState(() {
            _showBalance = !_showBalance;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [hlblue, text]),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          width: screenWidth,
          child: _showBalance
              ? Column(
                  children: <Widget>[
                    Text(
                      '₱$balanceAmount',
                      style: balAmt,
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Text(
                      '₱${generateMaskedBalance(balanceAmount)}',
                      style: balAmt,
                    ),
                  ],
                ),
        ),
      ),
    ],
  );
}
}