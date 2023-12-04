// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/data/database.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionsButtons extends StatefulWidget {
  final Function(String) onFilterChanged;

  const TransactionsButtons({required this.onFilterChanged, Key? key})
      : super(key: key);

  @override
  _TransactionsButtonsState createState() => _TransactionsButtonsState();
}

class _TransactionsButtonsState extends State<TransactionsButtons> {
  String selectedFilter = 'All';
  late Box<Transaction> _transactionBox;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('History', style: transacBold),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/transaction.png',
                    height: 30,
                  ),
                  SizedBox(width: medium),
                ],
              ),
              InkWell(
                onTap: () {
                  _showDeleteAllDialog();
                },
                child: Icon(
                  Icons.delete,
                  color: red,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: xsmall),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton(context, 'All', tCat, hlblue),
              _buildFilterButton(context, 'Pera In', tIn, green),
              _buildFilterButton(context, 'Pera Out', tOut, red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context, String filter,
      TextStyle textStyle, Color borderColor) {
    final isSelected = selectedFilter == filter;
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = filter;
          widget.onFilterChanged(filter);
        });
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 30.w, minWidth: 20.w),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border:
                isSelected ? Border.all(width: 2.5, color: borderColor) : null,
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: dgray,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(2, 2)),
            ]),
        child: Text(
          filter,
          style: textStyle.copyWith(color: isSelected ? borderColor : null),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showDeleteAllDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Flexible(child: Text('Delete All Transactions?', style: pOut)),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red, size: 35),
            ],
          ),
          content: Text('Are you sure you want to delete All Transactions?',
              style: transactxt),
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
                    _deleteAllTransactions();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Deleted All Transactions Successfully!')),
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

  void _deleteAllTransactions() async {
    await _transactionBox.clear(); // Clear all transactions

    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TransactionPage()),
    );
  }
}
