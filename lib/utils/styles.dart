import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var icon = const Color(0xFFB8BCCB);
var white = const Color(0xFFFFFFFF);
var black = const Color(0xFF000000);
var gray = const Color(0xFFE3E3E3);
var dgray = const Color(0x65000000);
var lgray = const Color(0x35E3DCDC);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);

// TextStyles
// Batangas TextStyles
TextStyle titlePera = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: hlblue);
TextStyle titlePlan = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: text);
TextStyle subPera = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: hlblue);
TextStyle subPlan = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: text);

//Lexend TextStyles
//10
TextStyle dateTime = GoogleFonts.lexend(
    fontSize: 10, fontWeight: FontWeight.normal, color: hlblue);
TextStyle hltxt = GoogleFonts.lexend(
    fontSize: 10, fontWeight: FontWeight.bold, color: hlblue);

//12
TextStyle tagline = GoogleFonts.lexend(
    fontSize: 12, fontWeight: FontWeight.normal, color: text);
TextStyle helpGreen =
    GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: green);
TextStyle helpRed =
    GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: red);
TextStyle helpText =
    GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: text);
TextStyle helpBlue = GoogleFonts.lexend(
    fontSize: 12, fontWeight: FontWeight.bold, color: hlblue);

//14
TextStyle tIn =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: green);
TextStyle tOut =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: red);
TextStyle tCat = GoogleFonts.lexend(
    fontSize: 14, fontWeight: FontWeight.bold, color: hlblue);
TextStyle txt = GoogleFonts.lexend(
    fontSize: 14, fontWeight: FontWeight.normal, color: dgray);

//16
TextStyle subHeaders = GoogleFonts.lexend(
    fontSize: 16, fontWeight: FontWeight.bold, color: hlblue);
TextStyle transactxt = GoogleFonts.lexend(
    fontSize: 16, fontWeight: FontWeight.normal, color: hlblue);
TextStyle alertPeraIn =
    GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: green);
TextStyle alertPeraOut =
    GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: red);

//18
TextStyle pText = GoogleFonts.lexend(
    fontSize: 18, fontWeight: FontWeight.normal, color: hlblue);

//20
TextStyle headers = GoogleFonts.lexend(
    fontSize: 20, fontWeight: FontWeight.bold, color: hlblue);
TextStyle dialogConfirm =
    GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: white);

//22
TextStyle lNormal = GoogleFonts.lexend(
    fontSize: 22, fontWeight: FontWeight.normal, color: hlblue);
TextStyle lBold = GoogleFonts.lexend(
    fontSize: 22, fontWeight: FontWeight.bold, color: hlblue);

//24
TextStyle pIn =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: green);
TextStyle pOut =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: red);
TextStyle transacNormal = GoogleFonts.lexend(
    fontSize: 24, fontWeight: FontWeight.normal, color: hlblue);
TextStyle transacBold = GoogleFonts.lexend(
    fontSize: 24, fontWeight: FontWeight.bold, color: hlblue);

TextStyle textBold =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: text);
TextStyle hintAmt =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: white);

//32
TextStyle balAmt =
    GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.bold, color: white);
TextStyle inpAmt =
    GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.bold, color: white);

// Gaps
var medium = 30.0;
var small = 16.0;
var xsmall = 10.0;
