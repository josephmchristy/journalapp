import 'package:flutter/material.dart';
import 'package:journalapp/widgets/user_preferences.dart';
import 'package:journalapp/models/journal_entry_field.dart';

class JournalEntryScreen extends StatelessWidget {
  static const routeKey = 'journal_entry';
  final void Function(bool) toggleTheme;
  final JournalEntryField journalEntryFields;

  const JournalEntryScreen({ Key? key, required this.toggleTheme, required this.journalEntryFields }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Text(journalEntryFields.title),
          Text(journalEntryFields.body),
          Text(journalEntryFields.rating.toString()),
          Text(journalEntryFields.dateTime.toString())
        ],
      )
    );
  }
}