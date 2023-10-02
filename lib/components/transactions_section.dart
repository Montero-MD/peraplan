import 'package:flutter/material.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({Key? key});

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
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10), // Add horizontal padding
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                medium), // Adjust the corner radius as needed
            color: lgray,
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between text and button
            children: [
              Text(
                'Transactions',
                style: transac,
              ),
              GestureDetector(
                onTap: () => _navigateToTransactionPage(context),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: text,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
