// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/components/peraout_section.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class PeraOutPage extends StatelessWidget {
  const PeraOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: Column(
            children: [
              const HeadingSection(),
              SizedBox(height: small),
              BalanceSection(
                username: '',
              ),
              const PeraOut(),
              SizedBox(height: xsmall),
            ],
          ),
        )));
  }
}
