// ignore_for_file: library_private_types_in_public_api, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:peraplan/data/database.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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

  Widget _buildTransactionData() {
    return Container(
      width: 80.w, // Set a fixed width
      height: 30.h,
      padding: const EdgeInsets.all(20.0),
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
      child: ValueListenableBuilder(
        valueListenable: _transactionBox.listenable(),
        builder: (context, Box<Transaction> box, _) {
          if (box.isEmpty) {
            return Center(
              child: Text(
                'No Transactions Available',
                style: transacBold,
                textAlign: TextAlign.center,
              ),
            );
          }

          // Display only the 5 latest entries
          int endIndex = box.length - 1;
          int startIndex = endIndex - 4; // Display the latest 5 entries
          if (startIndex < 0) {
            startIndex = 0;
          }

          return Column(
            children: [
              for (int index = endIndex; index >= startIndex; index--)
                Column(
                  children: [
                    _buildTransactionItem(box, index),
                    const SizedBox(height: 16.0),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(Box<Transaction> box, int index) {
    final transaction = box.getAt(index);
    // Determine the transaction type
    String transactionType = '';
    String imageAsset = '';
    Color amountColor = Colors.black;
    String amount = '';

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      imageAsset = 'assets/images/perain.png';
      amountColor = Colors.green;
      amount = "+₱${transaction.amount}";
    } else if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      imageAsset = 'assets/images/peraout.png';
      amountColor = Colors.red;
      amount = "-₱${transaction.amount}";
    }

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: amountColor,
    );

    return GestureDetector(
      onLongPress: () {
        // Show delete confirmation or directly delete the transaction
        _showDeleteDialog(transaction, index);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageAsset,
                width: 32, // Adjust the width as needed
                height: 32, // Adjust the height as needed
              ),
              const SizedBox(width: 8),
              Text(
                '${transaction?.category}',
                style: transactxt,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: unique),
              // Date and Time
              Text(
                '${DateFormat('MMMM dd').format(transaction?.date ?? DateTime.now())}, ${DateFormat.jm().format(DateTime(2022, 1, 1, transaction?.time.hour ?? 0, transaction?.time.minute ?? 0))}',
                style: dateTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Transaction? transaction, int index) {
    String transactionType = '';
    Color txtColor = Colors.black;

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      txtColor = green;
    }

    if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      txtColor = red;
    }

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: txtColor,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Text('Delete $transactionType?', style: pOut),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red),
            ],
          ),
          content: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Are you sure you want to delete this ',
                    style: transactxt),
                TextSpan(
                  text: transactionType,
                  style: unique,
                ),
                TextSpan(text: ' transaction?', style: transactxt),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: hlblue, width: 1),
                        borderRadius: BorderRadius.circular(35),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTransaction(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('$transactionType Deleted Successfully!')),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: dialogConfirm),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction(int index) {
    _transactionBox.deleteAt(index);

    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}

class AllTransactionsSection extends StatefulWidget {
  final String selectedFilter;

  const AllTransactionsSection({required this.selectedFilter, Key? key})
      : super(key: key);

  @override
  _AllTransactionsSectionState createState() => _AllTransactionsSectionState();
}

class _AllTransactionsSectionState extends State<AllTransactionsSection> {
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

  Widget _buildTransactionData() {
    return Container(
      width: 90.w,
      height: 50.h,
      padding: const EdgeInsets.all(20.0),
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
      child: ValueListenableBuilder(
        valueListenable: _transactionBox.listenable(),
        builder: (context, Box<Transaction> box, _) {
          if (box.isEmpty) {
            return Center(
              child: Text(
                'No Transactions Available',
                style: transacBold,
                textAlign: TextAlign.center,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                for (int index = box.length - 1; index >= 0; index--)
                  if (_shouldShowTransaction(box.getAt(index)))
                    Column(
                      children: [
                        _buildTransactionItem(box, index),
                        const SizedBox(height: 16.0),
                      ],
                    ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(Box<Transaction> box, int index) {
    final transaction = box.getAt(index);
    // Determine the transaction type
    String transactionType = '';
    String imageAsset = '';
    Color amountColor = Colors.black;
    String amount = '';

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      imageAsset = 'assets/images/perain.png';
      amountColor = green;
      amount = "+₱${transaction.amount}";
    } else if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      imageAsset = 'assets/images/peraout.png';
      amountColor = red;
      amount = "-₱${transaction.amount}";
    }

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: amountColor,
    );

    return GestureDetector(
      onLongPress: () {
        // Show delete confirmation or directly delete the transaction
        _showDeleteDialog(transaction, index);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageAsset,
                width: 32, // Adjust the width as needed
                height: 32, // Adjust the height as needed
              ),
              const SizedBox(width: 8),
              Text(
                '${transaction?.category}',
                style: transactxt,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: unique),
              // Date and Time
              Text(
                '${DateFormat('MMMM dd').format(transaction?.date ?? DateTime.now())}, ${DateFormat.jm().format(DateTime(2022, 1, 1, transaction?.time.hour ?? 0, transaction?.time.minute ?? 0))}',
                style: dateTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Transaction? transaction, int index) {
    String transactionType = '';
    Color txtColor = Colors.black;

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      txtColor = green;
    }

    if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      txtColor = red;
    }

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: txtColor,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Text('Delete $transactionType?', style: pOut),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red),
            ],
          ),
          content: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Are you sure you want to delete this ',
                    style: transactxt),
                TextSpan(
                  text: transactionType,
                  style: unique,
                ),
                TextSpan(text: ' transaction?', style: transactxt),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: hlblue, width: 1),
                        borderRadius: BorderRadius.circular(35),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTransaction(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('$transactionType Deleted Successfully!')),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: hintAmt),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction(int index) {
    _transactionBox.deleteAt(index);

    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  bool _shouldShowTransaction(Transaction? transaction) {
    if (widget.selectedFilter == 'All Transactions') {
      return true;
    } else if (widget.selectedFilter == 'Pera In' && transaction is PeraIn) {
      return true;
    } else if (widget.selectedFilter == 'Pera Out' && transaction is PeraOut) {
      return true;
    }
    return false;
  }
}
