import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

const DB_KEY_PATH = 'assets/db_key.json';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String dbKey = await rootBundle.loadString(DB_KEY_PATH);
  final data = await json.decode(dbKey);

  runApp(App(preferences: await SharedPreferences.getInstance()));
}