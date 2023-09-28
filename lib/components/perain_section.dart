import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/utils/currency_input_formatter.dart';

class PeraIn extends StatefulWidget {
  const PeraIn({super.key});

  @override
  State<PeraIn> createState() => _PeraInState();
}

class _PeraInState extends State<PeraIn> {
  final _formkey = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int selectedPeraIn = 0;
  int value = 0;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget peraIncategory(String inName, int index, {Icon? icon}) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedPeraIn = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(
            width: (selectedPeraIn == index) ? 2.5 : 1.0,
            color: (selectedPeraIn == index) ? green : text),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              inName,
              style: subHeaders,
            ),
          ),
          if (index == 1)
            const Positioned(
              left: 16,
              child: Icon(
                Icons.payments_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 2)
            const Positioned(
              left: 16,
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 3)
            const Positioned(
              left: 16,
              child: Icon(
                Icons.inventory_2_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (index == 4)
            const Positioned(
              left: 16,
              child: Icon(
                Icons.notes_rounded,
                size: 20,
                color: Color(0xFF0FA3B1),
              ),
            ),
          if (selectedPeraIn == index)
            const Positioned(
              bottom: 5,
              right: 5,
              child: Icon(
                Icons.check_circle,
                size: 16,
                color: Colors.green,
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
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: green,
                        style: inpAmt,
                        decoration: InputDecoration(
                          hintText: 'Enter Amount...',
                          hintStyle: hintAmt,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: lgray,
                        ),
                        inputFormatters: [
                          CurrencyInputFormatter(
                            leadingSymbol: CurrencySymbols.PESO_SIGN,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
            SafeArea(
              child: Text('Category:', style: headers),
            ),
            SizedBox(
              height: xxsmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: peraIncategory("Salary", 1),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: peraIncategory("Allowance", 2),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: peraIncategory("Investments", 3),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: peraIncategory("Others", 4),
                ),
                const SizedBox(
                  width: 20,
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
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2.5, color: green),
                      color: green,
                    ),
                    child: Icon(
                      Icons.arrow_outward,
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
