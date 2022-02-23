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
        leading: Builder(
        builder: (context) => IconButton(
          icon: (const Icon(Icons.settings)),
          onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      body: Column(
        children: const [
          JournalEntryForm(),
        ])
    );
  }
}