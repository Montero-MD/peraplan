import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';

class BalanceSection extends StatefulWidget {
  const BalanceSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundedTextBackground(
            userName: 'Allana Balance', balanceAmount: balanceAmount),
        SizedBox(height: small),
      ],
    );
  }
}

class RoundedTextBackground extends StatelessWidget {
  final String userName;
  final double balanceAmount;

  RoundedTextBackground({required this.userName, required this.balanceAmount});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding:
          const EdgeInsets.all(20.0), // Add 10 pixels of padding from all edges
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [hlblue, text]),
        // Background color
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      width: screenWidth, // Set the container width to the screen width
      child: Column(
        children: <Widget>[
          Text(
            userName,
            style: uName,
          ),
          SizedBox(height: small), // Add spacing between the text elements
          Text(
            '\₱$balanceAmount', // Display the balance amount with a peso sign
            style: balAmt,
          ),
        ],
      ),
    );
  }
}
