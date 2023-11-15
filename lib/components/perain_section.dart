import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:peraplan/data/database.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/utils/currency_input_formatter.dart';

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
  void write(BinaryWriter writer, TimeOfDay time) {
    writer.writeByte(time.hour);
    writer.writeByte(time.minute);
  }
}

class _PeraInState extends State<PeraIn> {
  final _formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int selectedPeraIn = 0;
  int value = 0;

  // reference our box
  PeraPlanDB db = PeraPlanDB();

  // save new Pera In
  void saveNewPeraIn() {
    setState(() {
      db.peraIntransactions.add([
        _controller.text,
        selectedDate,
        selectedTime,
        selectedPeraIn,
      ]);
      _controller.clear();
      db.updateDatabase();
    });
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
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pera In', style: pIn),
                  Icon(
                    Icons.money,
                    size: 30,
                    color: hlblue,
                  )
                ],
              ),
            ),
            SizedBox(height: xsmall),
            Container(
              padding: const EdgeInsets.all(20.0),
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
                                  return 'Invalid/Null Amount entered';
                                }
                                return null;
                              },
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: green,
                              style: inpAmt,
                              decoration: InputDecoration(
                                hintText: 'Enter Amount...',
                                hintStyle: hintAmt,
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                CurrencyInputFormatter(
                                  leadingSymbol: CurrencySymbols.peso_sign,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Date:', style: headers),
                SizedBox(width: small),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                            });
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: lgray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fixedSize: const Size(130, 20),
                        ),
                        child: Text(
                          "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
                          style: subHeaders,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: small),
                Text('Time:', style: headers),
                SizedBox(width: small),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () async {
                          final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial,
                            builder: (context, childWidget) {
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: false,
                                ),
                                child: childWidget!,
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
                          backgroundColor: lgray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set the radius here
                          ),
                          fixedSize: const Size(100, 20),
                        ),
                        child: Text(
                          selectedTime.format(context).toString(),
                          style: subHeaders,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Category:', style: headers),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: lgray,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        hint: Text(
                          'Select Category',
                          textAlign: TextAlign.center,
                        ),
                        onChanged: (String? newValue) {},
                        items: <String>[
                          'Salary',
                          'Allowance',
                          'Investments',
                          'Others'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: tCat,
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                        ),
                        style: txt,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              // 'Button' to save form
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      saveNewPeraIn(); // calls the function to save the data
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2.5, color: green),
                      color: green,
                    ),
                    child: Icon(
                      Icons.north_east,
                      color: white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
