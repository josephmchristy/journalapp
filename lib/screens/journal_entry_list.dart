import 'package:flutter/material.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/widgets/journal_app_scaffold.dart';
import 'package:journalapp/widgets/journal_entries.dart';

class JournalEntryListScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';
  final void Function(bool) toggleTheme;

  const JournalEntryListScreen({ Key? key, required this.toggleTheme  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalAppScaffold(
      toggleTheme: toggleTheme,
      bodyWidget: Column(
        children: [
           ElevatedButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => NewEntryScreen(toggleTheme: toggleTheme))
              );
            }, 
            child: const Text('Add Journal Entry')
          ),
          JournalEntries(),
        ],
      )
    );
  }
}