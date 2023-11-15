import 'package:flutter/material.dart';
import 'package:peraplan/components/username_section.dart';
import 'package:peraplan/components/pera_buttons.dart';
import 'package:peraplan/utils/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: small, top: small, right: small),
          child: Column(
            children: [
              const UsernameSec(),
            ],
          ),
        )));
  }
}
