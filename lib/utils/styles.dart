import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var icon = const Color(0xFFB8BCCB);
var background = const Color(0xFFF6F6F6);
var white = const Color(0xFFFFFFFF);
var black = const Color(0xFF000000);
var gray = const Color(0xFFE3E3E3);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);

// TextStyles
TextStyle titlePera = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: hlblue);
TextStyle titlePlan = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: text);
TextStyle subPera = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: hlblue);
TextStyle subPlan = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: text);

TextStyle headers =
    GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: text);
TextStyle subHeaders = GoogleFonts.lexend(
    fontSize: 15, fontWeight: FontWeight.normal, color: text);
TextStyle inpAmt =
    GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w700, color: green);
TextStyle pIn =
    GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: green);
TextStyle pOut =
    GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w700, color: red);
TextStyle pText =
    GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w400, color: icon);
TextStyle uName = GoogleFonts.lexend(
    fontSize: 24, fontWeight: FontWeight.normal, color: white);
TextStyle balAmt =
    GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.bold, color: white);
TextStyle transac =
    GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w700, color: text);
TextStyle hintAmt =
    GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w600, color: icon);

TextStyle tIn =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w400, color: green);
TextStyle tOut =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w400, color: red);
TextStyle tCat =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400, color: text);

// Gaps
var large = 50.0;
var medium = 30.0;
var small = 16.0;
var xsmall = 10.0;
var xxsmall = 5.0;
var cont = 330.0;
