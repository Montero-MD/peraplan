import 'package:flutter/material.dart';
import 'package:peraplan/pages/home_page.dart';

void main() {
  runApp(const PeraPlan());
}

class PeraPlan extends StatelessWidget {
  const PeraPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
