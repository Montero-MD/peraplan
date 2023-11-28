// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/components/help_section_4.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/heading_section.dart';

class HelpPage4 extends StatelessWidget {
  const HelpPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeadingSection(),
                SizedBox(height: small),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Help ', style: transacBold),
                          TextSpan(
                            text: 'Page',
                            style: textBold,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: small),
                HistorPageHelp(),
              ],
            ),
          ),
        )));
  }
}
