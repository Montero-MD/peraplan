// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/components/heading_section_help.dart';
import 'package:peraplan/components/help_section_1.dart';
import 'package:peraplan/utils/styles.dart';

class HelpPage1 extends StatelessWidget {
  const HelpPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(left: small, top: small, right: small),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeadingSectionHelp(),
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
                HomePageHelp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
