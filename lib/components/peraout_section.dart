import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:peraplan/data/database.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/utils/styles.dart';

class PeraOutSection extends StatefulWidget {
  const PeraOutSection({super.key});

  @override
  State<PeraOutSection> createState() => _PeraOutSectionState();
}

class _PeraOutSectionState extends State<PeraOutSection> {
  final _formkey = GlobalKey<FormState>();
  int value = 0;
  late Box<Transaction> _transactionBox;
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  // save new Pera Out
  void saveNewPeraOut() {
    // Parse the amount from the string to double
    double parsedAmount = double.tryParse(_amountController.text) ?? 0.0;
    Transaction newTransaction;

    newTransaction = PeraOut(
      amount: parsedAmount,
      date: _selectedDate,
      time: _selectedTime,
      category: _selectedCategory,
    );

    _transactionBox.add(newTransaction);
    _amountController.clear();

    setState(() {});
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
                  Text('Pera Out', style: pOut),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/peraout.png',
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
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: red,
                              style: inpAmt,
                              decoration: InputDecoration(
                                hintText: 'Enter Amount...',
                                hintStyle: hintAmt,
                                border: InputBorder.none,
                                prefixText: '-    ₱',
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
                                    initialDate: _selectedDate,
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
                                      _selectedDate = dateTime;
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
                                  "${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}",
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
                                    initialTime: _selectedTime,
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
                                      _selectedTime = timeOfDay;
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
                                  _selectedTime.format(context).toString(),
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
                                        offset: const Offset(2, 2)),
                                  ]),
                              child: SizedBox(
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  value: _selectedCategory,
                                  hint: Text(
                                    'Select Category',
                                    textAlign: TextAlign.center,
                                    style: txt,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCategory = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Food',
                                    'Travel',
                                    'School',
                                    'Shopping',
                                    'Bills',
                                    'Fitness',
                                    'Subscriptions',
                                    'Vacation',
                                    'Others'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    Map<String, IconData> categoryIcons = {
                                      'Food': Icons.restaurant,
                                      'Travel': Icons.directions_bus,
                                      'School': Icons.account_balance,
                                      'Shopping': Icons.shopping_cart_checkout,
                                      'Bills': Icons.bolt,
                                      'Fitness': Icons.fitness_center_rounded,
                                      'Subscriptions': Icons.credit_card,
                                      'Vacation': Icons.card_travel,
                                      'Others': Icons.category,
                                    };
                                    Map<String, Color> categoryColors = {
                                      'Food': red,
                                      'Travel': red,
                                      'School': red,
                                      'Shopping': red,
                                      'Bills': red,
                                      'Fitness': red,
                                      'Subscriptions': red,
                                      'Vacation': red,
                                      'Others': red,
                                    };

                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Icon(
                                            categoryIcons[value]!,
                                            color: categoryColors[value],
                                          ),
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
                                      horizontal: 16.0,
                                      vertical: 10.0,
                                    ),
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
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: small),
                  Row(
                    // 'Button' to save form
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration:
                                      BoxDecoration(color: white, boxShadow: [
                                    BoxShadow(
                                        color: dgray,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2)),
                                  ]),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Row(
                                      children: [
                                        Text('Pera Out', style: pOut),
                                        const SizedBox(width: 5),
                                        Image.asset(
                                          'assets/images/peraout.png',
                                          height: 30,
                                        )
                                      ],
                                    ),
                                    content: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Are you sure you want to proceed with this ',
                                              style: transactxt),
                                          TextSpan(
                                            text: 'Pera Out',
                                            style: alertPeraOut,
                                          ),
                                          TextSpan(
                                              text: ' transaction?',
                                              style: transactxt),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              padding: const EdgeInsets.all(5),
                                              width: 120,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: hlblue, width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(35),
                                                  color: white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: dgray,
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset:
                                                            const Offset(2, 2)),
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text('Cancel',
                                                      style: headers),
                                                ],
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              saveNewPeraOut();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Pera Out Saved Successfully!')),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              padding: const EdgeInsets.all(5),
                                              width: 120,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(35),
                                                  color: red,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: dgray,
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset:
                                                            const Offset(2, 2)),
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text('Pera Out',
                                                      style: dialogConfirm),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ); // calls the function to save the data
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
                              Text('Pera Out', style: hintAmt),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
