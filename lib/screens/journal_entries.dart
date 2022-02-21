import 'package:flutter/material.dart';
import 'package:journalapp/widgets/journal_entry_form.dart';

class JournalEntriesScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';

  JournalEntriesScreen({ Key? key }) : super(key: key);

  final items = List<Map>.generate(1000, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      // body: ListView.builder(itemBuilder: (context, index){
      //   return ListTile(
      //     leading: FlutterLogo(),
      //     trailing: Icon(Icons.more_horiz),
      //     title: Text('Journal Entry ${items[index]['title']}'),
      //     subtitle: Text('Example ${items[index]['subtitle']}'),
      //   );
      // })
      body: JournalEntryForm()
    );
  }
}