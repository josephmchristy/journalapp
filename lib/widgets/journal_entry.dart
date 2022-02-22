import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field.dart';

class JournalEntry extends StatelessWidget {

  final JournalEntryField journalEntryFields;

  const JournalEntry({ Key? key,  required this.journalEntryFields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.ac_unit),
            title: Text(journalEntryFields.title),
            subtitle: Text(journalEntryFields.body),
            isThreeLine: true,
          )
        ],
      )
    );
  }
}