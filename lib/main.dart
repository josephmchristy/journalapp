import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

const DB_KEY_PATH = 'assets/schema_1.sql.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String dbKey = await rootBundle.loadString(DB_KEY_PATH);

  runApp(App(preferences: await SharedPreferences.getInstance()));
}