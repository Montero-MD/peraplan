import 'package:flutter/material.dart';
import 'package:peraplan/pages/help_page_1.dart';
import 'package:peraplan/pages/help_page_3.dart';
import 'package:peraplan/utils/styles.dart';

class PeraInHelp extends StatelessWidget {
  PeraInHelp({super.key});
  final DateTime _selectedDate = DateTime.now();
  final TimeOfDay _selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: lgray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Text('Enter Amount', style: balAmt),
              ],
            ),
          ),
          SizedBox(height: small),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Enter amount to ', style: helpText),
                    TextSpan(
                      text: 'add ',
                      style: helpGreen,
                    ),
                    TextSpan(text: 'to your balance.', style: helpText),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: medium),
          SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Details', style: headers)],
            ),
          ),
          SizedBox(height: xsmall),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: lgray,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  Text(
                                    "${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}",
                                    style: hltxt,
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: small),
                    Text('Time', style: subHeaders),
                    SizedBox(width: xsmall),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: lgray,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  Text(_selectedTime.format(context).toString(),
                                      style: hltxt)
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: small),
                Row(
                  children: [
                    Text('Category:', style: subHeaders),
                    SizedBox(width: xsmall),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: lgray,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Select Category',
                                        style: txt,
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: hlblue)
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: small),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: small),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Automatically enters the current date and time but editable by tapping on the field.\n\nChoose the category of your transaction.\n\nPress the button to finish your transaction.',
                  style: helpText,
                ),
              ),
            ],
          ),
          SizedBox(height: medium),
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
                    Text('Pera In', style: pIn),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assets/images/perain.png',
                      height: 30,
                    ),
                  ],
                ),
                SizedBox(height: small),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'Are you sure you want to proceed with this ',
                                style: transactxt),
                            TextSpan(
                              text: 'Pera In',
                              style: alertPeraIn,
                            ),
                            TextSpan(
                              text: ' transaction?',
                              style: transactxt,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: small),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: hlblue, width: 1),
                          color: white,
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
                          Text('Cancel', style: headers),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: green,
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
                          Text('Pera In', style: dialogConfirm),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: small),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'A confirmation message of your transaction.',
                  style: helpText,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const HelpPage1(); // change to HelpPage1
                      },
                      transitionDuration: const Duration(
                          milliseconds: 100), // Set a shorter duration
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Offset begin = Offset(-1.0, 0.0);
                        const Offset end = Offset.zero;
                        const Curve curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hlblue,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: white,
                    size: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const HelpPage3();
                      },
                      transitionDuration: const Duration(
                          milliseconds: 100), // Set a shorter duration
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Offset begin = Offset(1.0, 0.0);
                        const Offset end = Offset.zero;
                        const Curve curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hlblue,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: white,
                    size: 35,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
