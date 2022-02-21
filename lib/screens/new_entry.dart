import 'package:flutter/material.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';

class NewEntryScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';

  const NewEntryScreen({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entry Form'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: const Text('Go back to Journal Entries')
          ),
          const JournalEntryForm(),
        ])
    );
  }
}