import 'package:flutter/material.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the container
      children: [
        Center(
          child: Container(
            width: cont,
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add horizontal padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  medium), // Adjust the corner radius as needed
              color: gray,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Space between text and button
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle the "Transactions" text tap here
                    // You can add any desired action or leave it empty
                  },
                  child: Text(
                    'Transactions',
                    style: transac,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TransactionPage(),
                    ));
                  },
                  borderRadius:
                      BorderRadius.circular(10), // Make the border circular
                  splashColor:
                      Colors.blue, // Customize the pressing effect color
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: text,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
