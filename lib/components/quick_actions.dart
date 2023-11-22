import 'package:flutter/material.dart';
import 'package:peraplan/pages/perain_page.dart';
import 'package:peraplan/pages/peraout_page.dart';
import 'package:peraplan/pages/transaction_page.dart';
import 'package:peraplan/utils/styles.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Quick ', style: lBold),
              TextSpan(
                text: 'Actions',
                style: lNormal,
              ),
            ],
          ),
        ),
        SizedBox(height: xsmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QuickActionButton(
              text: 'Pera In',
              imagePath: 'assets/images/perain.png',
              textStyle: tIn,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const PeraInPage();
                  },
                ));
              },
            ),
            QuickActionButton(
              text: 'Pera Out',
              imagePath: 'assets/images/peraout.png',
              textStyle: tOut,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const PeraOutPage();
                  },
                ));
              },
            ),
            QuickActionButton(
              text: 'History',
              imagePath: 'assets/images/transaction.png',
              textStyle: tCat,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const TransactionPage();
                  },
                ));
              },
            ),
          ],
        )
      ],
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const QuickActionButton({
    required this.text,
    required this.imagePath,
    required this.textStyle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        child: Container(
          width: 100, // Adjust the width as needed
          height: 100, // Adjust the height as needed
          // Add spacing between buttons
          decoration: BoxDecoration(
            color: white, // Set the background color
            boxShadow: [
              BoxShadow(
                  color: dgray,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 4)),
            ],
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: textStyle, // Set the provided text style
              ),
              Image.asset(
                imagePath,
                height: 70, // Set image height
              ),
            ],
          ),
        ),
      ),
    );
  }
}
