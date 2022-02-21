import 'package:flutter/material.dart';
import 'package:journalapp/screens/journal_entry_list.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/themes/custom_theme.dart';

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  var _isDarkTheme;

  @override
  void initState() {
    super.initState();
    _isDarkTheme = false;
  }

  void toggleTheme(bool toggle) {
    setState(() {
      _isDarkTheme = toggle;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final routes = {
      '/': (context) => JournalEntryListScreen(toggleTheme: toggleTheme),
      'newEntry': (context) => NewEntryScreen(toggleTheme: toggleTheme)
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: _isDarkTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme,
      routes: routes,
    );
  }
}