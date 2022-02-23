import 'package:flutter/material.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/widgets/journal_entries.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class JournalEntryListScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';
  final void Function(bool) toggleTheme;

  const JournalEntryListScreen({ Key? key, required this.toggleTheme  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
        leading: Builder(
        builder: (context) => IconButton(
          icon: (const Icon(Icons.settings)),
          onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => NewEntryScreen(toggleTheme: toggleTheme))
          );
        },
      ),
      body: Column(
        children: [
          JournalEntries(toggleTheme: toggleTheme,),
        ],
      )
    );
  }
}