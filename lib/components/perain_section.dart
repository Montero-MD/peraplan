import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class PeraIn extends StatefulWidget {
  const PeraIn({super.key});

  @override
  State<PeraIn> createState() => _PeraInState();
}

class _PeraInState extends State<PeraIn> {
  final _formkey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  int value = 0;
  Widget peraIntype(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Lexend",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: (value == index) ? Colors.green : Color(0xFF0FA3B1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Pera In', style: pIn),
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
                            cursorColor: green,
                            style: inpAmt,
                            decoration: InputDecoration(
                              hintText: 'Enter Amount...',
                              hintStyle: hintAmt,
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              ThousandsFormatter(allowFraction: true)
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Date:', style: subPlan),
                  Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid/Null date entered';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              DateInputFormatter(),
                            ],
                            textAlign: TextAlign.center,
                            cursorColor: hlblue,
                            style: subPlan,
                            decoration: InputDecoration(
                              hintText: 'MM/DD/YYYY',
                              hintStyle: pText,
                              border: InputBorder.none,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(width: small),
                  Text('Time:', style: subPlan),
                  Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid/Null time entered';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9:]+$')),
                            ],
                            textAlign: TextAlign.center,
                            cursorColor: hlblue,
                            style: subPlan,
                            decoration: InputDecoration(
                              hintText: 'hh:mm AM/PM',
                              hintStyle: pText,
                              border: InputBorder.none,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Text('Category:', style: subPlan),
              Row(children: <Widget>[
                Expanded(child: peraIntype("Salary", 1)),
                Expanded(child: peraIntype("Allowance", 2)),
              ]),
              Row(
                children: <Widget>[
                  Expanded(child: peraIntype("Investments", 3)),
                  Expanded(child: peraIntype("Pension", 4)),
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
                            border: Border.all(width: 2.5, color: green),
                            color: green),
                        child: Icon(
                          Icons.arrow_outward,
                          color: white,
                          size: 35,
                        ),
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
