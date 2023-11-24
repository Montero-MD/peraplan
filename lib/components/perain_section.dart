import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:peraplan/data/database.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/utils/styles.dart';

class PeraIn extends StatefulWidget {
  const PeraIn({super.key});

  @override
  State<PeraIn> createState() => _PeraInState();
}

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final typeId = 101; // Unique ID for this adapter

  @override
  TimeOfDay read(BinaryReader reader) {
    final hour = reader.readByte();
    final minute = reader.readByte();
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer.writeByte(obj.hour);
    writer.writeByte(obj.minute);
  }
}

class _PeraInState extends State<PeraIn> {
  final _formkey = GlobalKey<FormState>();
  final _pera = TextEditingController();
  double? finalpera;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int value = 0;
  String? selectedCategory;

  // reference our box
  PeraPlanDB db = PeraPlanDB();

  // save new Pera In
  void saveNewPeraIn(double? finalpera) {
    setState(() {
      db.peraInTransactions.add([
        finalpera,
        selectedDate,
        selectedTime,
        selectedCategory,
      ]);
      _pera.clear();
      db.updatePeraInTransactions();
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pera In', style: pIn),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/perain.png',
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(height: xsmall),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: width * .7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [hlblue, text]),
                  boxShadow: [
                    BoxShadow(
                        color: dgray,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(2, 2)),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: lgray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter an Amount';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Invalid Double';
                                }
                                return null;
                              },
                              controller: _pera,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: green,
                              style: inpAmt,
                              decoration: InputDecoration(
                                hintText: 'Enter Amount...',
                                hintStyle: hintAmt,
                                border: InputBorder.none,
                                prefixText: '₱',
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}$'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: small),
            SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Details', style: headers)],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: dgray,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(2, 2)),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Date', style: subHeaders),
                      SizedBox(width: xsmall),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: dgray,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2)),
                                  ]),
                              child: OutlinedButton(
                                onPressed: () async {
                                  final DateTime? dateTime =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor:
                                              hlblue, // Change the primary color
                                          colorScheme: ColorScheme.light(
                                              primary: hlblue),
                                          buttonTheme: const ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (dateTime != null) {
                                    setState(() {
                                      selectedDate = dateTime;
                                    });
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  fixedSize: const Size(100, 30),
                                  side: const BorderSide(
                                    color: Colors
                                        .transparent, // Set the outline color to transparent
                                    width: 1.0, // Set the outline width
                                  ),
                                ),
                                child: Text(
                                  "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
                                  style: hltxt,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: small),
                      Text('Time', style: subHeaders),
                      SizedBox(width: xsmall),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: dgray,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2)),
                                  ]),
                              child: OutlinedButton(
                                onPressed: () async {
                                  final TimeOfDay? timeOfDay =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: selectedTime,
                                    initialEntryMode: TimePickerEntryMode.dial,
                                    builder: (context, childWidget) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: false,
                                        ),
                                        child: Theme(
                                          data: ThemeData.light().copyWith(
                                            primaryColor:
                                                hlblue, // Change the primary color
                                            colorScheme: ColorScheme.light(
                                                primary: hlblue),
                                            buttonTheme: const ButtonThemeData(
                                                textTheme:
                                                    ButtonTextTheme.primary),
                                          ),
                                          child: childWidget!,
                                        ),
                                      );
                                    },
                                  );
                                  if (timeOfDay != null) {
                                    setState(() {
                                      selectedTime = timeOfDay;
                                    });
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  fixedSize: const Size(100, 30),
                                  side: const BorderSide(
                                    color: Colors
                                        .transparent, // Set the outline color to transparent
                                    width: 1.0, // Set the outline width
                                  ),
                                ),
                                child: Text(
                                  selectedTime.format(context).toString(),
                                  style: hltxt,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: small),
                  Row(
                    children: [
                      Text('Category', style: subHeaders),
                      SizedBox(width: xsmall),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: dgray,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<String>(
                                value: selectedCategory,
                                hint: Text(
                                  'Select Category',
                                  textAlign: TextAlign.center,
                                  style: txt,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                },
                                items: <String>[
                                  'Salary',
                                  'Allowance',
                                  'Investments',
                                  'Others'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  // Map each category to its respective icon
                                  Map<String, IconData> categoryIcons = {
                                    'Salary': Icons.payment,
                                    'Allowance':
                                        Icons.account_balance_wallet_rounded,
                                    'Investments': Icons.account_balance,
                                    'Others': Icons.category,
                                  };
                                  Map<String, Color> categoryColors = {
                                    'Salary':
                                        green, // Replace with your green color
                                    'Allowance': green,
                                    'Investments': green,
                                    'Others': green,
                                  };

                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        Icon(categoryIcons[value]!,
                                            color: categoryColors[value]),
                                        SizedBox(width: xsmall),
                                        Text(
                                          value,
                                          style: tCat,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: hlblue),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a category';
                                  }
                                  return null;
                                },
                                style: txt,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: small),
                 //...
SizedBox(height: small),
Row(
 // 'Button' to save form
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
    GestureDetector(
      onTap: () {
        if (_pera.text.isNotEmpty && _formkey.currentState!.validate()) {
          double finalPera = double.parse(_pera.text);

          // Display confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirm Transaction'),
                content: Text('Are you sure you want to proceed with this transaction of Pera In: $finalPera ?'),
                actions: [
                 TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                 ),
                 TextButton(
                    onPressed: () {
                      saveNewPeraIn(finalPera);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Pera In Saved Successfully!')),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Proceed'),
                 ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        width: 185,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: LinearGradient(colors: [hlblue, text]),
            boxShadow: [
              BoxShadow(
                 color: dgray,
                 blurRadius: 5,
                 spreadRadius: 1,
                 offset: const Offset(2, 2)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pera In', style: hintAmt),
            SizedBox(width: small),
            Icon(
              Icons.arrow_forward,
              size: 32,
              color: white,
            )
          ],
        ),
      ),
    ),
 ],
),
//...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
