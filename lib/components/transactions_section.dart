// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:peraplan/data/database.dart';

class TransactionsSection extends StatefulWidget {
  const TransactionsSection({Key? key}) : super(key: key);

  @override
  _TransactionsSectionState createState() => _TransactionsSectionState();
}

class _TransactionsSectionState extends State<TransactionsSection> {
  late Box<Transaction> _transactionBox;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  // page animation
  void _navigateToTransactionPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const TransactionPage();
        },
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add horizontal padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  medium), // Adjust the corner radius as needed
              color: lgray,
            ),
            child: Column(
              children: [
                _buildTransactionData(),
              ],
            ))
      ],
    );
  }

// needs frontend makeover
  Widget _buildTransactionData() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8, // Set a fixed height
      height: height * 0.5, // Set a fixed height
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
          boxShadow: [
            BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2)),
          ]),
      child: ValueListenableBuilder(
        valueListenable: _transactionBox.listenable(),
        builder: (context, Box<Transaction> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final transaction = box.getAt(index);
              // Determine the transaction type
              String transactionType = '';
              if (transaction is PeraIn) {
                transactionType = 'Pera In';
              } else if (transaction is PeraOut) {
                transactionType = 'Pera Out';
              }

              return ListTile(
                title: Text(transactionType),
                subtitle: Text(
                    'Amount: ${transaction?.amount}\nDate: ${DateFormat('yyyy-MM-dd').format(transaction?.date ?? DateTime.now())}\nTime: ${transaction?.time ?? TimeOfDay.now()}\nCategory: ${transaction?.category}'),
              );
            },
          );
        },
      ),
    );
  }
}
