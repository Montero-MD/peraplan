// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:peraplan/data/database.dart';
import 'package:google_fonts/google_fonts.dart';

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

  double calculateBalance() {
    double peraInTotal = _peraPlanDB.peraInTransactions
        .map<double>((transaction) => transaction[0] as double)
        .fold(0, (prev, amount) => prev + amount);

    double peraOutTotal = _peraPlanDB.peraOutTransactions
        .map<double>((transaction) => transaction[0] as double)
        .fold(0, (prev, amount) => prev + amount);

    return peraInTotal - peraOutTotal;
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
                _buildTransactionData(latestPeraIn, "Pera In"),
                SizedBox(height: small),
                // Display the latest 5 entries for Pera Out transactions
                _buildTransactionData(latestPeraOut, "Pera Out"),
              ],
            ))
      ],
    );
  }

  Widget _buildTransactionData(List<dynamic> transactions, String title) {
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
                return TransactionItem(
                  transaction: transaction,
                  title: title,
                  onDelete: () {
                    // Call the delete function here
                    _deleteTransaction(context, transaction);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      );
    } else {
      return Text(
        'No $title Transactions Available',
        style: txt,
      );
    }
  }

  // Function to delete a transaction
  void _deleteTransaction(BuildContext context, List<dynamic> transaction) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Transaction'),
          content: const Text('Are you sure you want to delete this transaction?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Delete the transaction and update the UI
                _performDeleteTransaction(transaction);
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to actually delete the transaction
 void _performDeleteTransaction(List<dynamic> transaction) {
 setState(() {
    // Remove the transaction from the list
    _peraPlanDB.peraInTransactions.remove(transaction);
    _peraPlanDB.peraOutTransactions.remove(transaction);
 });
}
}

class TransactionItem extends StatelessWidget {
  final List<dynamic> transaction;
  final String title;
  final VoidCallback onDelete;

  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.title,
    required this.onDelete,
  }) : super(key: key);

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

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: title == "Pera In" ? const Color.fromARGB(255, 55, 153, 58) : Colors.red,
    );

    if (title == "Pera In") {
      amount = "+₱$amount";
    } else {
      amount = "₱$amount";
    }

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
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: title == "Pera In" ? Colors.green : Colors.red,
                ),
              ),
              Text(category, style: transactxt),
            ],
          ),
          SizedBox(width: large),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: unique),
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
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
