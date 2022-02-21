import 'package:flutter/material.dart';
import 'package:journalapp/widgets/user_preferences.dart';

class JournalAppScaffold extends StatelessWidget {
  final Widget bodyWidget;
  final void Function(bool) toggleTheme;

  const JournalAppScaffold({Key? key, required this.bodyWidget, required this.toggleTheme }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
      ),
      drawer: UserPreferencesDrawer(toggleTheme: toggleTheme),
      body: bodyWidget,
    );
  }
}