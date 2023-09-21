import 'package:flutter/material.dart';
import 'package:peraplan/pages/peraout_page.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/pages/perain_page.dart';

class PeraButton extends StatelessWidget {
  const PeraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PeraInPage(),
            ));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2.5, color: text)),
            child: Icon(
              Icons.add,
              color: green,
              size: 35,
            ),
          )),
      SizedBox(width: large),
      GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PeraOutPage(),
            ));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2.5, color: text)),
            child: Icon(
              Icons.remove,
              color: red,
              size: 35,
            ),
          ))
    ]);
  }
}
