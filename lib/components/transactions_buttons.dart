// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('History', style: transacBold),
              const SizedBox(width: 5),
              Image.asset(
                'assets/images/transaction.png',
                height: 30,
              )
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton(context, 'All', tCat, text),
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
        width: 25.w,
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
}
