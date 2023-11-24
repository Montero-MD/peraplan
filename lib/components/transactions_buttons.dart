import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';

class TransactionsButtons extends StatefulWidget {
  final Function(String) onFilterChanged;

  const TransactionsButtons({required this.onFilterChanged, Key? key})
      : super(key: key);

  @override
  _TransactionsButtonsState createState() => _TransactionsButtonsState();
}

class _TransactionsButtonsState extends State<TransactionsButtons> {
  String selectedFilter = 'All Transactions';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFilterButton(context, 'All Transactions', tCat, text),
          _buildFilterButton(context, 'Pera In', tIn, green),
          _buildFilterButton(context, 'Pera Out', tOut, red),
        ],
      ),
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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border:
              isSelected ? Border.all(width: 2.5, color: borderColor) : null,
          borderRadius: BorderRadius.circular(10),
          color: lgray,
        ),
        child: Text(
          filter,
          style: textStyle.copyWith(color: isSelected ? borderColor : null),
        ),
      ),
    );
  }
}
