import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';

class BalanceSection extends StatefulWidget {
  const BalanceSection({Key? key}) : super(key: key);

  @override
  _DynamicBalanceDisplayState createState() => _DynamicBalanceDisplayState();
}

class _DynamicBalanceDisplayState extends State<BalanceSection> {
  double balanceAmount = 0.0; // Initial balance amount

  void addBalance() {
    // Simulate updating the balance amount
    setState(() {
      balanceAmount +=
          10.0; // Increment the balance amount (you can replace this with your own logic)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Your ', style: lNormal),
              TextSpan(
                text: 'Balance',
                style: lBold,
              ),
            ],
          ),
        ),
        SizedBox(
            height: xsmall), // Add some space between the text and the balance
        RoundedTextBackground(
            balanceAmount:
                balanceAmount), // Use the RoundedTextBackground widget
        SizedBox(height: small),
      ],
    );
  }
}

class RoundedTextBackground extends StatelessWidget {
  final double balanceAmount;

  const RoundedTextBackground({Key? key, required this.balanceAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [hlblue, text]),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: screenWidth,
      child: Column(
        children: <Widget>[
          Text(
            '₱$balanceAmount', // Display the balance amount with a peso sign
            style: balAmt,
          ),
        ],
      ),
    );
  }
}
