import 'package:flutter/material.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/utils/styles.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2.5, color: text)),
            child: Icon(
              Icons.other_houses_rounded,
              color: text,
              size: 35,
            ),
          )),
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
      GestureDetector(
          onTap: () {
            //Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2.5, color: text)),
            child: Icon(
              Icons.question_mark,
              color: text,
              size: 35,
            ),
          )),
    ]);
  }
}
