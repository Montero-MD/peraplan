import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/quick_actions.dart';
import 'package:peraplan/components/transaction_latest.dart';
import 'package:peraplan/components/transactions_section.dart';
import 'package:peraplan/components/heading_section.dart';
import 'package:peraplan/utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit the app?'),
              actions: [
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Close the app
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          },
        );
        return false; // Prevent default behavior
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
                const Transaction_Title(),
                SizedBox(height: small),
                const TransactionsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
