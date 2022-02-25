import 'package:flutter/material.dart';
import 'package:journalapp/db/database_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseManager.initialize();
  runApp(App(preferences: await SharedPreferences.getInstance()));
}