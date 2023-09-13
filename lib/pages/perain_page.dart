import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class PeraInPage extends StatelessWidget {
  const PeraInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: Column(
            children: [
              const HeadingSection(),
              SizedBox(height: small),
              BalanceSection(),
            ],
          ),
        )));
  }
}
