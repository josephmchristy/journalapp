import 'package:flutter/material.dart';
import 'package:journalapp/widgets/user_preferences.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/screens/journal_entry.dart';
import 'package:journalapp/screens/journal_entry_list.dart';

class JournalAppScaffold extends StatelessWidget {
  final Widget bodyWidget;
  final Widget floatingActionButtonWidget;
  final void Function(bool) toggleTheme;

  const JournalAppScaffold({
    Key? key, 
    required this.bodyWidget, 
    required this.floatingActionButtonWidget, 
    required this.toggleTheme 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      body: bodyWidget,
      floatingActionButton: floatingActionButtonWidget,
    );
  }
}