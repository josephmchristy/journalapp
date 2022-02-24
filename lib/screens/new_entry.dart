import 'package:flutter/material.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class NewEntryScreen extends StatelessWidget {

  static const routeKey = 'new_entry';
  final void Function(bool) toggleTheme;
  final void Function() loadJournal;

  const NewEntryScreen({ Key? key, required this.toggleTheme, required this.loadJournal }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
        actions:[
          Builder(builder: (context) => IconButton(
            icon: (const Icon(Icons.settings)),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          )
        ],
        leading: Container(),
      ),
      endDrawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      body: Column(
        children: [
          JournalEntryForm(loadJournal: loadJournal,),
        ])
    );
  }
}