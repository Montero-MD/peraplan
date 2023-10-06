import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/components/perain_section.dart';
import 'package:peraplan/pages/splash.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(TimeOfDayAdapter());
  // open the box
  var _mybox = await Hive.openBox('peraplanDB');
  runApp(const PeraPlan());
}

class PeraPlan extends StatelessWidget {
  const PeraPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
