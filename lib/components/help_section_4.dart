// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:peraplan/pages/help_page_3.dart';
import 'package:peraplan/utils/styles.dart';

class HistorPageHelp extends StatelessWidget {
  const HistorPageHelp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('History', style: transacBold),
              const SizedBox(width: 5),
              Image.asset(
                'assets/images/transaction.png',
                height: 30,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container for 'All' filter
            Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2.5, color: hlblue),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    'All',
                    style: tCat.copyWith(color: hlblue),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Displays ', style: helpText),
                          TextSpan(
                            text: 'all ',
                            style: helpBlue,
                          ),
                          TextSpan(
                              text: 'of the transactions you have entered.',
                              style: helpText),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Other filter containers with descriptions
            // For 'Pera In'
            Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2.5, color: green),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    'Pera In',
                    style: tIn,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Only displays the ', style: helpText),
                          TextSpan(
                            text: 'Pera In ',
                            style: helpGreen,
                          ),
                          TextSpan(
                              text: 'transactions you have entered.',
                              style: helpText),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // For 'Pera Out'
            Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2.5, color: red),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    'Pera Out',
                    style: tOut.copyWith(color: red),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Only displays the ', style: helpText),
                          TextSpan(
                            text: 'Pera Out ',
                            style: helpRed,
                          ),
                          TextSpan(
                              text: 'transactions you have entered.',
                              style: helpText),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const HelpPage3();
                    },
                    transitionDuration: const Duration(milliseconds: 100),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const Offset begin = Offset(-1.0, 0.0);
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
                  Icons.arrow_back,
                  color: white,
                  size: 35,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
