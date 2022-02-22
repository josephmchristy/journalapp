import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class NewEntryScreen extends StatelessWidget {

  static const routeKey = 'new_entry';
  final void Function(bool) toggleTheme;

  const NewEntryScreen({ Key? key, required this.toggleTheme }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
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