import 'package:flutter/material.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/widgets/journal_entries_scaffold.dart';

class JournalEntryListScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';

  const JournalEntryListScreen({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      body: Column(
        children: [
           ElevatedButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const NewEntryScreen())
              );
            }, 
            child: const Text('Add Journal Entry')
          ),
          JournalEntriesScaffold(),
        ],
      )
    );
  }
}