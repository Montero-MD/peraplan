// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:peraplan/data/database.dart';

class TransactionsSection extends StatefulWidget {
  const TransactionsSection({Key? key}) : super(key: key);

  @override
  _TransactionsSectionState createState() => _TransactionsSectionState();
}

class _TransactionsSectionState extends State<TransactionsSection> {
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

  List<dynamic> getLatestEntries(List<dynamic> transactions, int count) {
    // Ensure the transactions list is not null and not empty
    if (transactions.isNotEmpty) {
      // Sort the transactions by date in descending order
      transactions.sort((a, b) => b[1].compareTo(a[1]));

      // Take the first 'count' transactions
      return transactions.take(count).toList();
    }

    return [];
  }

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
    // Get the latest 5 entries for Pera In transactions
    final latestPeraIn = getLatestEntries(_peraPlanDB.peraInTransactions, 5);

    // Get the latest 5 entries for Pera Out transactions
    final latestPeraOut = getLatestEntries(_peraPlanDB.peraOutTransactions, 5);
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
                _buildTransactionData(latestPeraIn),
                SizedBox(height: small),
                // Display the latest 5 entries for Pera Out transactions
                _buildTransactionData(latestPeraOut),
              ],
            ))
      ],
    );
  }

  Widget _buildTransactionData(List<dynamic> transactions) {
    if (transactions.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(medium),
              color: lgray,
            ),
            child: Stack(
              children: transactions.map<Widget>((transaction) {
                return TransactionItem(transaction: transaction);
              }).toList(),
            ),
          ),
        ],
      );
    } else {
      return Text(
        'No transactions available.',
        style: txt,
      );
    }
  }
}

class TransactionItem extends StatelessWidget {
  final List<dynamic> transaction;
  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  String formatDateTime(DateTime dateTime) {
    final String monthName = DateFormat.MMMM().format(dateTime);
    final int day = dateTime.day;

    return '$monthName $day';
  }

  @override
  Widget build(BuildContext context) {
    // Extract data from the transaction list
    String amount = transaction[0].toString();
    DateTime date = transaction[1];
    TimeOfDay time = transaction[2];
    String category = transaction[3].toString();
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category, style: transactxt),
          SizedBox(width: xlarge),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: tIn),
              Row(
                children: [
                  Text(
                    ' ${formatDateTime(date)}',
                    style: hltxt,
                  ),
                  Text(
                    ', ${time.format(context)}',
                    style: hltxt,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
