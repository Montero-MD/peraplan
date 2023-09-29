import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/utils/currency_input_formatter.dart';

class PeraOut extends StatefulWidget {
  const PeraOut({super.key});

  @override
  State<PeraOut> createState() => _PeraOutState();
}

class _PeraOutState extends State<PeraOut> {
  final _formkey = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int selectedPeraOut = 0;
  int value = 0;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget peraOutcategory(String inName, int index, {Icon? icon}) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedPeraOut = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (selectedPeraOut == index) ? 2.0 : 0.5,
            color:
                (selectedPeraOut == index) ? Colors.red : Colors.blue.shade600),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              inName,
              style: subHeaders,
            ),
          ),
          if (index == 1)
            const Positioned(
              left: 5,
              child: Icon(
                Icons.payments_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 2)
            const Positioned(
              left: 5,
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 3)
            const Positioned(
              left: 5,
              child: Icon(
                Icons.inventory_2_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 4)
            const Positioned(
              left: 5,
              child: Icon(
                Icons.notes_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (selectedPeraOut == index)
            const Positioned(
              bottom: 5,
              right: 5,
              child: Icon(
                Icons.check_circle,
                size: 15,
                color: Colors.red,
              ),
            ),
          if (icon != null)
            Positioned(
              top: 5,
              left: 5,
              child: icon,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Pera Out', style: pOut),
              Row(
                children: [
                  Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: background, width: 1),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid/Null Amount entered';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: red,
                            style: outAmt,
                            decoration: InputDecoration(
                              hintText: 'Enter Amount...',
                              hintStyle: hintAmt,
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              CurrencyInputFormatter(
                                  leadingSymbol: CurrencySymbols.PESO_SIGN)
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Date:', style: headers),
                  SizedBox(width: xsmall),
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
                              backgroundColor: Colors.grey.shade100,
                              fixedSize: const Size(120, 20),
                            ),
                            child: Text(
                                "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
                                style: subHeaders),
                          )
                        ]),
                  ),
                  SizedBox(width: xsmall),
                  Text('Time:', style: headers),
                  SizedBox(width: xsmall),
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
                                          alwaysUse24HourFormat: false),
                                      child: childWidget!);
                                },
                              );
                              if (timeOfDay != null) {
                                setState(() {
                                  selectedTime = timeOfDay;
                                });
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              fixedSize: const Size(105, 20),
                            ),
                            child: Text(selectedTime.format(context).toString(),
                                style: subHeaders),
                          )
                        ]),
                  ),
                ],
              ),
              Text('Category:', style: headers),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: peraOutcategory("Salary", 1),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: peraOutcategory("Allowance", 2),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: peraOutcategory("Investments", 3),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: peraOutcategory("Others", 4),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
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
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2.5, color: red),
                        color: red,
                      ),
                      child: Transform(
                        transform: Matrix4.identity()..scale(-1.0, -1.0),
                        alignment: Alignment
                            .center, // Align the transformation in the center of the child
                        child: Icon(
                          Icons.arrow_outward,
                          color: white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
