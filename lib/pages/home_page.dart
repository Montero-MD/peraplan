// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/quick_actions.dart';
import 'package:peraplan/components/transactions_section.dart';
import 'package:peraplan/components/heading_section.dart';
import 'package:peraplan/utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Text('Are you sure?', style: transacBold),
                  const SizedBox(width: 5),
                  Icon(Icons.exit_to_app, color: red),
                ],
              ),
              content: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Do you want to exit ', style: transactxt),
                    TextSpan(
                      text: 'Pera',
                      style: subPera,
                    ),
                    TextSpan(
                      text: 'Plan',
                      style: subPlan,
                    ),
                    TextSpan(text: '?', style: transactxt),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: hlblue, width: 1),
                            borderRadius: BorderRadius.circular(35),
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
                            Text('No', style: headers),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Close the app
                        SystemNavigator.pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: hlblue,
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
                            Text('Yes', style: dialogConfirm),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return false;
      },
      child: Scaffold(
          backgroundColor: white,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: small, top: small, right: small),
            child: Column(
              children: [
                const HeadingSection(),
                SizedBox(height: small),
                const BalanceSection(),
                const QuickActions(),
                SizedBox(height: small),
                const TransactionsSection(),
              ],
            ),
          ))),
    );
  }
}
