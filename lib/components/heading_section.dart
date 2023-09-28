import 'package:flutter/material.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/utils/styles.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({Key? key});

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
                transitionDuration:
                    const Duration(milliseconds: 100), // Set a shorter duration

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
        InkWell(
          onTap: () {
            // Navigator.of(context).pop();
          },
          borderRadius: BorderRadius.circular(50), // Make the border circular
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make the container circular
              border: Border.all(width: 2.5, color: background),
            ),
            child: Icon(
              Icons.question_mark,
              color: background,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
