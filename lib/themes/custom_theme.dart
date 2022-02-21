import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      splashColor: Colors.amber,
      scaffoldBackgroundColor: Colors.blueGrey[800],
      //fontFamily: 'OpenSansCondensed',
      textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
        )
      ),
      cardTheme: CardTheme(
        color: Colors.teal[300],
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      splashColor: Colors.amber,
      scaffoldBackgroundColor: Colors.black,
      //fontFamily: 'OpenSansCondensed',
      textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
        )
      ),
      cardTheme: CardTheme(
        color: Colors.teal[300],
      ),
    );
  }
}