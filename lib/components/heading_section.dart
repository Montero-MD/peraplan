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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
          borderRadius: BorderRadius.circular(50), // Make the border circular
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make the container circular
              border: Border.all(width: 2.5, color: text),
            ),
            child: Icon(
              Icons.house_rounded,
              color: text,
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
