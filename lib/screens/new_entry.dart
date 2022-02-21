import 'package:flutter/cupertino.dart';
import 'package:journalapp/widgets/journal_app_scaffold.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';

class NewEntryScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';
  final void Function(bool) toggleTheme;

  const NewEntryScreen({ Key? key, required this.toggleTheme }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return JournalAppScaffold(
      toggleTheme: toggleTheme,
      bodyWidget: Column(
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