import 'package:flutter/material.dart';
import 'package:peraplan/pages/help_page_2.dart';
import 'package:peraplan/utils/styles.dart';

class HomePageHelp extends StatelessWidget {
  const HomePageHelp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '₱1000',
                    style: balAmt,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.visibility,
                    size: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: small),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            'Displays you current balance after entering your ',
                        style: helpText),
                    TextSpan(
                      text: 'Pera In ',
                      style: helpGreen,
                    ),
                    TextSpan(text: 'and ', style: helpText),
                    TextSpan(text: 'Pera Out ', style: helpRed),
                    TextSpan(text: 'transactions.', style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [hlblue, text]),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '₱****',
                    style: balAmt,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.visibility_off,
                    size: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: small),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Pressing the eye icon would hide your balance.\n\nPressing the icon again would show your balance.',
                style: helpText,
              ),
            ),
          ],
        ),
        SizedBox(height: medium),

        //Quick Actions
        Column(
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
          ],
        ),
        SizedBox(height: xsmall),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pera In
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: dgray,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pera In',
                        style: tIn,
                      ),
                      Image.asset(
                        'assets/images/perain.png',
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: small),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Directs you to the ', style: helpText),
                        TextSpan(
                          text: 'Pera In ',
                          style: helpGreen,
                        ),
                        TextSpan(text: 'Page.', style: helpText),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: small),
            // Pera Out
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: dgray,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pera Out',
                        style: tOut,
                      ),
                      Image.asset(
                        'assets/images/peraout.png',
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: small),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Directs you to the ', style: helpText),
                        TextSpan(
                          text: 'Pera Out ',
                          style: helpRed,
                        ),
                        TextSpan(text: 'Page.', style: helpText),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: small),
            // History
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: dgray,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'History',
                        style: tCat,
                      ),
                      Image.asset(
                        'assets/images/transaction.png',
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: small),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Directs you to the ', style: helpText),
                        TextSpan(
                          text: 'Transaction History ',
                          style: helpBlue,
                        ),
                        TextSpan(text: 'Page.', style: helpText),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: small),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Latest ', style: transacBold),
                  TextSpan(
                    text: 'Transactions',
                    style: transacNormal,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: xsmall),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Shows the ', style: helpText),
              TextSpan(
                text: 'latests transactions ',
                style: helpBlue,
              ),
              TextSpan(text: 'entered.', style: helpText),
            ],
          ),
        ),
        SizedBox(height: small),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const HelpPage2();
                    },
                    transitionDuration: const Duration(
                        milliseconds: 100), // Set a shorter duration
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const Offset begin = Offset(1.0, 0.0);
                      const Offset end = Offset.zero;
                      const Curve curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hlblue,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: white,
                  size: 35,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
