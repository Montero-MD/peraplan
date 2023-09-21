import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/utils/styles.dart';

class PeraIn extends StatefulWidget {
  const PeraIn({super.key});

  @override
  State<PeraIn> createState() => _PeraInState();
}

class _PeraInState extends State<PeraIn> {
  int? selectedRadio;

  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pera In', style: pIn),
        Row(
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: icon, width: 1),
                      ),
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      cursorColor: hlblue,
                      style: subPera,
                      decoration: InputDecoration(
                        hintText: 'Enter Amount...',
                        hintStyle: inpAmt,
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(?:,\d{3})*(\.\d{0,2})?$')),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
        SizedBox(height: xsmall),
        Row(
          children: [
            Text('Date:', style: subPera),
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      textAlign: TextAlign.center,
                      cursorColor: hlblue,
                      style: subPera,
                      decoration: InputDecoration(
                        hintText: 'MM/DD/YYYY',
                        hintStyle: pText,
                        border: InputBorder.none,
                      ),
                    ),
                  ]),
            ),
            SizedBox(width: small),
            Text('Time:', style: subPera),
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      textAlign: TextAlign.center,
                      cursorColor: hlblue,
                      style: subPera,
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
        SizedBox(height: xsmall),
        Text('Category:', style: subPera),
        Row(
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioListTile(
                      title: Text('Salary', style: tCat),
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Investments', style: tCat),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Allowance', style: tCat),
                      value: 3,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Pension', style: tCat),
                      value: 4,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ],
    ));
  }
}
