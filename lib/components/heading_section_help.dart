// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/utils/styles.dart';

class HeadingSectionHelp extends StatelessWidget {
  const HeadingSectionHelp({Key? key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const HomePage();
                },
                transitionDuration: const Duration(milliseconds: 200),
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
          borderRadius: BorderRadius.circular(50),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.5, color: hlblue),
            ),
            child: Icon(
              Icons.house_rounded,
              color: hlblue,
              size: 35,
            ),
          ),
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
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.5, color: white),
              ),
              child: Icon(
                Icons.question_mark,
                color: white,
                size: 35,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
