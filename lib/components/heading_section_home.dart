// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/pages/help_page_1.dart';
import 'package:peraplan/utils/styles.dart';

class HeadingSectionHome extends StatelessWidget {
  const HeadingSectionHome({Key? key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.house_rounded,
          color: white,
          size: 35,
        ),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Pera', style: subPera),
                  TextSpan(
                    text: 'Plan',
                    style: subPlan,
                  ),
                ],
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const HelpPage1();
                },
                transitionDuration: const Duration(milliseconds: 200),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  Offset begin = const Offset(1.0, 0.0);
                  Offset end = Offset.zero;
                  Curve curve = Curves.easeInOut;
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

          borderRadius: BorderRadius.circular(50), // Make the border circular
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make the container circular
              border: Border.all(width: 2.5, color: hlblue),
            ),
            child: Icon(
              Icons.question_mark,
              color: hlblue,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
