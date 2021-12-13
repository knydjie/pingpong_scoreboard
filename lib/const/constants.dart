import 'package:flutter/material.dart';

///COLOR CONSTANTS
//WelcomeScreen Color
const mainGreen = Color(0xFF097969);
const buttonGreen = Color(0xFF50C878);

//ConfigurationScreen Color
const lightestGreen = Color(0xFFECFFDC);
const aBitGray = Color(0xFFC1E1C1);
const grayishBlue = Color(0xFF8A9A5B);
const darkestBlue = Color(0xFF478778);
const blueThumb = Color(0xFF0BDA51);

///SCREENS CONSTANTS
//WelcomeScreen
const mainTitleTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

//ConfigurationScreen
const textFieldDecoration = InputDecoration(
  hintText: 'Enter name',
  hintStyle: TextStyle(color: Colors.white60, fontSize: 15.0),
  labelText: 'Player 1',
  labelStyle: TextStyle(
    color: lightestGreen,
    fontWeight: FontWeight.bold,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: lightestGreen, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF99FFFF), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF99FFFF), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  errorStyle: TextStyle(color: Color(0xFF99FFFF)),
  counterStyle: TextStyle(color: lightestGreen),
);

//GameScreen
const textGameScreenColor = Color(0xFF097969);

const nameTextStyle = TextStyle(
  color: textGameScreenColor,
  fontWeight: FontWeight.bold,
);

const pointTextStyle = TextStyle(
  color: textGameScreenColor,
  fontWeight: FontWeight.bold,
);

//WinnerScreen
const pointResultTextStyle = TextStyle(
  color: mainGreen,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const numberPointResultTextStyle = TextStyle(
  color: mainGreen,
  fontSize: 15.0,
);

const nameResultTextStyle = TextStyle(
  color: lightestGreen,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const winnerResultTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);
