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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundedTextBackground(
          balanceAmount: balanceAmount,
        ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Your ', style: lNormal),
            TextSpan(
              text: 'Balance',
              style: lBold,
            ),
          ],
        )),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [hlblue, text]),
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Text(
                '₱$balanceAmount',
                style: balAmt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
