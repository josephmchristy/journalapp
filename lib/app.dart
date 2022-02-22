import 'package:flutter/material.dart';
import 'package:journalapp/screens/journal_entry.dart';
import 'package:journalapp/screens/journal_entry_list.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/themes/custom_theme.dart';

class App extends StatefulWidget {

  const App({Key? key}) : super(key: key);



  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  
  late bool isDarkTheme;

  @override
  void initState() {
    super.initState();
    isDarkTheme = false;
  }

  void toggleTheme(bool toggle) {
    setState(() {
      isDarkTheme = toggle;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final routes = {
      '/': (context) => JournalEntryListScreen(toggleTheme: toggleTheme),
      'newEntry': (context) => NewEntryScreen(toggleTheme: toggleTheme),
      //'journalEntry': (context) => JournalEntryScreen(toggleTheme: toggleTheme)
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme,
      routes: routes,
    );
  }
}