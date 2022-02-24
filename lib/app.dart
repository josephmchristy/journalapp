import 'package:flutter/material.dart';
import 'package:journalapp/screens/journal_entry.dart';
import 'package:journalapp/screens/journal_entry_list.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/themes/custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {

  final SharedPreferences preferences;

  const App({Key? key, required this.preferences}) : super(key: key);



  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {

  static const IS_DARK_THEME_KEY = 'isDarkTheme';

  bool get isDarkTheme => widget.preferences.getBool(IS_DARK_THEME_KEY) ?? false;

  void toggleTheme(bool toggle) {
    setState(() {
      widget.preferences.setBool(IS_DARK_THEME_KEY, toggle);
    });
    
  }
  
  @override
  Widget build(BuildContext context) {

    final routes = {
      '/': (context) => JournalEntryListScreen(toggleTheme: toggleTheme),
      //'newEntry': (context) => NewEntryScreen(toggleTheme: toggleTheme),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme,
      routes: routes,
    );
  }
}