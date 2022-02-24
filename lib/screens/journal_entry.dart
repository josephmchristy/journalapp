import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';
import 'package:journalapp/widgets/journal_entry.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class JournalEntryScreen extends StatelessWidget {
  static const routeKey = 'journal_entry';
  final void Function(bool) toggleTheme;
  final JournalEntryFieldDTO journalEntryFields;

  const JournalEntryScreen({ Key? key, required this.toggleTheme, required this.journalEntryFields }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
        leading: Builder(
        builder: (context) => IconButton(
          icon: (const Icon(Icons.keyboard_backspace)),
          onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      body: Column(
        children: [
          JournalEntry(journalEntryFields: journalEntryFields),
        ],
      )
    );
  }
}