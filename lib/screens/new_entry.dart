import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class NewEntryScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';

  const NewEntryScreen({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entry Form'),
      ),
      drawer: const UserPreferencesDrawer(),
      body: Column(
        children: [
          const JournalEntryForm(),
          CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              onPressed: (){
                Navigator.pop(context);
              }
            )
          ),
        ])
    );
  }
}