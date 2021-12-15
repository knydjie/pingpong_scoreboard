import 'package:flutter/material.dart';

enum ColorTheme { green, blue, purple }

///COLOR CONSTANTS
//WelcomeScreen Color
Color mainColor = const Color(0xFF097969);
Color buttonColor = const Color(0xFF50C878);

//ConfigurationScreen Color
Color lightestColor = const Color(0xFFECFFDC);
Color aBitColor = const Color(0xFFC1E1C1);
Color grayishColor = const Color(0xFF8A9A5B);
Color darkestColor = const Color(0xFF478778);
Color thumbColor = const Color(0xFF0BDA51);

//GameScreen
Color textGameScreenColor = const Color(0xFF097969);

void changeColorTheme(ColorTheme theme) {
  if (theme == ColorTheme.green) {
    mainColor = const Color(0xFF097969);
    buttonColor = const Color(0xFF50C878);
    lightestColor = const Color(0xFFECFFDC);
    aBitColor = const Color(0xFFC1E1C1);
    grayishColor = const Color(0xFF8A9A5B);
    darkestColor = const Color(0xFF478778);
    thumbColor = const Color(0xFF0BDA51);
    textGameScreenColor = const Color(0xFF097969);
  } else if (theme == ColorTheme.blue) {
    mainColor = const Color(0xFF0047AB);
    buttonColor = const Color(0xFF1560BD);
    lightestColor = const Color(0xFFE6F2FF);
    aBitColor = const Color(0xFFB3D9FF);
    grayishColor = const Color(0xFF5F84A2);
    darkestColor = const Color(0xFF002366);
    thumbColor = const Color(0xFF1E90FF);
    textGameScreenColor = const Color(0xFF0047AB);
  } else {
    mainColor = const Color(0xFF702963);
    buttonColor = const Color(0xFFBF40BF);
    lightestColor = const Color(0xFFE6E6FA);
    aBitColor = const Color(0xFFCBC3E3);
    grayishColor = const Color(0xFFCCCCFF);
    darkestColor = const Color(0xFF673147);
    thumbColor = const Color(0xFFAA98A9);
    textGameScreenColor = const Color(0xFF702963);
  }
}

///SCREENS CONSTANTS
//WelcomeScreen
const mainTitleTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

//ConfigurationScreen
InputDecoration textFieldDecoration = InputDecoration(
  hintText: 'Enter name',
  hintStyle: const TextStyle(color: Colors.white60, fontSize: 15.0),
  labelText: 'Player 1',
  labelStyle: TextStyle(
    color: lightestColor,
    fontWeight: FontWeight.bold,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: lightestColor, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF99FFFF), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF99FFFF), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  errorStyle: const TextStyle(color: Color(0xFF99FFFF)),
  counterStyle: TextStyle(color: lightestColor),
);

//WinnerScreen
TextStyle pointResultTextStyle = TextStyle(
  color: mainColor,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

TextStyle numberPointResultTextStyle = TextStyle(
  color: mainColor,
  fontSize: 15.0,
);

TextStyle nameResultTextStyle = TextStyle(
  color: lightestColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle winnerResultTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
);
