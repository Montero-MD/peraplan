// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:peraplan/pages/help_page_3.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        SizedBox(height: medium),
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Text('Deleting a Transaction', style: transacBold)),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red, size: 35),
            ],
          ),
        ),
        SizedBox(height: medium),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'To ', style: helpText),
                    TextSpan(
                      text: 'delete ',
                      style: helpRed,
                    ),
                    TextSpan(
                        text:
                            'a transaction, simply swipe it to either left or right edge of the screen.',
                        style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          width: 90.w,
          height: 9.h,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance_wallet_rounded, color: green),
                  const SizedBox(width: 8),
                  Text(
                    'Allowance',
                    style: transactxt,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Amount
                  Text('+₱1000', style: alertPeraIn),
                  // Date and Time
                  Text(
                    'December 03, 9:38 PM',
                    style: dateTime,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: medium),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'A swipe to the ', style: helpText),
                    TextSpan(
                      text: 'right',
                      style: helpBlue,
                    ),
                    TextSpan(text: ':', style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          width: 90.w,
          height: 9.h,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 43.w,
                height: 9.h,
                color: red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: white),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.account_balance_wallet_rounded, color: green),
                  const SizedBox(width: 8),
                  Text(
                    'Allowance',
                    style: transactxt,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: small),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'A swipe to the ', style: helpText),
                    TextSpan(
                      text: 'left',
                      style: helpBlue,
                    ),
                    TextSpan(text: ':', style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          width: 90.w,
          height: 9.h,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
            boxShadow: [
              BoxShadow(
                color: dgray,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Amount
                  Text('+₱1000', style: alertPeraIn),
                  // Date and Time
                  Text(
                    'December 03, 9:38 PM',
                    style: dateTime,
                  ),
                ],
              ),
              Container(
                width: 43.w,
                height: 9.h,
                color: red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: white),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: medium),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'An ', style: helpText),
                    TextSpan(
                      text: 'alert dialog ',
                      style: helpBlue,
                    ),
                    TextSpan(
                        text: 'will then appear to confirm the action.',
                        style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width * .9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: dgray,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(child: Text('Delete Pera In?', style: pOut)),
                  const SizedBox(width: 5),
                  Icon(Icons.delete, color: red),
                ],
              ),
              SizedBox(height: small),
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Are you sure you want to delete this ',
                              style: transactxt),
                          TextSpan(
                            text: 'Pera In',
                            style: alertPeraIn,
                          ),
                          TextSpan(
                            text: ' transaction?',
                            style: transactxt,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: small),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: hlblue, width: 1),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: dialogConfirm),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: medium),
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Text('Deleting All Transactions', style: transacBold)),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red, size: 35),
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'To ', style: helpText),
                    TextSpan(
                      text: 'delete ',
                      style: helpRed,
                    ),
                    TextSpan(
                        text: 'all transactions, simply tap the ',
                        style: helpText),
                    TextSpan(text: '"trash can" icon.', style: helpRed),
                    TextSpan(text: 'and an ', style: helpText),
                    TextSpan(text: 'alert dialog ', style: helpBlue),
                    TextSpan(
                        text: 'will then appear to confirm the action.',
                        style: helpText),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: small),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width * .9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: dgray,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text('Delete All Transactions?', style: pOut)),
                  const SizedBox(width: 5),
                  Icon(Icons.delete, color: red, size: 35),
                ],
              ),
              SizedBox(height: small),
              Row(
                children: [
                  Expanded(
                    child: Flexible(
                        child: Text(
                            'Are you sure you want to delete all transactions?',
                            style: transactxt)),
                  )
                ],
              ),
              SizedBox(height: small),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: hlblue, width: 1),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: dialogConfirm),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: medium),
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
