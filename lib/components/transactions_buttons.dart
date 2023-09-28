import 'package:flutter/material.dart';
import 'package:peraplan/components/pera_buttons.dart';
import 'package:peraplan/pages/perain_transac_page.dart';
import 'package:peraplan/pages/peraout_transac_page.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';

class TransactionsButtons extends StatefulWidget {
  const TransactionsButtons({Key? key});

  @override
  _TransactionsButtonsState createState() => _TransactionsButtonsState();
}

class _TransactionsButtonsState extends State<TransactionsButtons> {
  String selectedButton = 'All Transactions';

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center the buttons
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the buttons horizontally
        children: [
          _buildButton(context, 'All Transactions', tCat, text),
          _buildButton(context, 'Pera In', tIn, green),
          _buildButton(context, 'Pera Out', tOut, red),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, TextStyle textStyle,
      Color borderColor) {
    final isSelected = selectedButton == label;
    return InkWell(
      onTap: () {
        // Handle button tap based on the label
        setState(() {
          selectedButton = label;
        });
        if (label == 'All Transactions') {
        } else if (label == 'Pera In') {
        } else if (label == 'Pera Out') {}
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Make the container rectangular
          border:
              isSelected ? Border.all(width: 2.5, color: borderColor) : null,
          borderRadius: BorderRadius.circular(10),
          color: gray, // Background color
        ),
        child: Text(
          label,
          style: textStyle.copyWith(
              color: isSelected ? borderColor : null), // Border color
        ),
      ),
    );
  }
}
