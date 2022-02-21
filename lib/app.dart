import 'package:flutter/material.dart';
import 'package:journalapp/screens/journal_entry_list.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/themes/light_theme.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  static final routes = {
    '/': (context) => const JournalEntryListScreen(),
    'newEntry': (context) => const NewEntryScreen()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.appTheme,
      routes: routes,
    );
  }
}