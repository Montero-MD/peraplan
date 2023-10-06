import 'package:hive_flutter/hive_flutter.dart';

class PeraPlanDB {
  // list of Pera In Transactions
  List peraIntransactions = [];

  // reference our box
  final _mybox = Hive.box('peraplanDB');

  // load the data
  void loadData() {
    peraIntransactions = _mybox.get('PeraIn_Transactions');
  }

  // update the database
  void updateDatabase() {
    _mybox.put("PeraIn_Transactions", peraIntransactions);
  }
}
