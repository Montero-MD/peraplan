import 'package:hive_flutter/hive_flutter.dart';

class PeraPlanDB {
  // list of Pera In Transactions
  List peraInTransactions = [];

  // list of Pera Out transactions
  List peraOutTransactions = [];

  // reference our box
  final _mybox = Hive.box('peraplanDB');

  // load the data for Pera In Transactions
  void loadPeraInTransactions() {
    peraInTransactions = _mybox.get('PeraIn_Transactions') ?? [];
  }

  // load the data for another type of transactions
  void loadPeraOutTransactions() {
    peraOutTransactions = _mybox.get('PeraOut_Transactions') ?? [];
  }

  // update the database for Pera In Transactions
  void updatePeraInTransactions() {
    _mybox.put("PeraIn_Transactions", peraInTransactions);
  }

  // update the database for another type of transactions
  void updatePeraOutTransactions() {
    _mybox.put("PeraOut_Transactions", peraOutTransactions);
  }
}
