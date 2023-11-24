// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/data/database.dart';
import 'package:peraplan/pages/splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  var _mybox = await Hive.openBox<Transaction>('transactions');

  runApp(const PeraPlan());
}

class PeraPlan extends StatelessWidget {
  const PeraPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
          debugShowCheckedModeBanner: false, home: Splash());
    });
  }
}
