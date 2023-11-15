import 'package:flutter/material.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TransactionsSection extends StatefulWidget {
  const TransactionsSection({Key? key}) : super(key: key);

  @override
  _TransactionsSectionState createState() => _TransactionsSectionState();
}

class _TransactionsSectionState extends State<TransactionsSection> {
  late Box<dynamic> _mybox;

  @override
  void initState() {
    super.initState();
    // Open the Hive box for transactions
    _mybox = Hive.box('peraplanDB'); // Replace 'peraplanDB' with your box name
  }

  void _navigateToTransactionPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TransactionPage();
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
        Row(
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
            SizedBox(width: large),
            GestureDetector(
              onTap: () => _navigateToTransactionPage(context),
              child: Icon(
                Icons.arrow_right_alt,
                color: text,
                size: 40,
              ),
            ),
            // Add spacing between the button and transaction data
          ],
        ),
        SizedBox(height: small),
        Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add horizontal padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  medium), // Adjust the corner radius as needed
              color: lgray,
            ),
            child: Column(
              children: [_buildTransactionData()],
            ))
      ],
    );
  }

  Widget _buildTransactionData() {
    // Retrieve and display transaction data from the Hive box
    final transactionData = _mybox.get(
        'PeraIn_Transactions'); // Replace 'yourTransactionKey' with the actual key
    if (transactionData != null) {
      // Handle how you want to display the data here
      return Column(
        children: transactionData.map<Widget>((transaction) {
          return TransactionItem(transaction: transaction);
        }).toList(),
      );
    } else {
      return Text(
        'Transaction Sheet Empty!',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$category', style: transactxt),
              SizedBox(width: xlarge),
              Column(
                children: [
                  Text('$amount', style: tIn),
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
          )
        ],
      ),
    );
  }
}
