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
              icon: Icons.attach_money_rounded, // Replace with the desired icon
              textStyle: tIn, // Text style for the first button
              onPressed: () {
                // Navigate to the screen for "Pera In"
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const PeraInPage();
                  },
                ));
              },
            ),
            QuickActionButton(
              text: 'Pera Out',
              icon: Icons.money_off, // Replace with the desired icon
              textStyle: tOut, // Text style for the second button
              onPressed: () {
                // Navigate to the screen for "Pera Out"
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const PeraOutPage();
                  },
                ));
              },
            ),
            QuickActionButton(
              text: 'History',
              icon: Icons.history, // Replace with the desired icon
              textStyle: tCat, // Text style for the third button
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
  final IconData icon;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const QuickActionButton({
    required this.text,
    required this.icon,
    required this.textStyle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        // elevation: 1, // Add a shadow (you can adjust the elevation)
        // color: Colors.transparent,
        child: Container(
          width: 100, // Adjust the width as needed
          height: 100, // Adjust the height as needed
          // Add spacing between buttons
          decoration: BoxDecoration(
            color: lgray, // Set the background color
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: textStyle, // Set the provided text style
              ),
              Icon(
                icon,
                color: hlblue, // Set icon color
                size: 40, // Set icon size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
