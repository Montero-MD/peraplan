// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/perain_section.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class PeraInPage extends StatelessWidget {
  const PeraInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: Column(
            children: [
              const HeadingSection(),
              SizedBox(height: small),
              const BalanceSection(),
              const PeraIn()
            ],
          ),
        )));
  }
}
