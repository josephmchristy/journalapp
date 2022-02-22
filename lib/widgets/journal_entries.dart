import 'package:flutter/material.dart';
import 'package:journalapp/screens/journal_entry.dart';
import 'package:journalapp/models/journal_entry_field.dart';

class JournalEntries extends StatelessWidget {

  final void Function(bool) toggleTheme;

  JournalEntries({ Key? key, required this.toggleTheme }) : super(key: key);

   final items = List<Map>.generate(20, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
      'body': 'Body text for $i',
      'rating': 5,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return ListTile(
            leading: const FlutterLogo(),
            trailing: const Icon(Icons.more_horiz),
            title: Text('Journal Entry ${items[index]['title']}'),
            subtitle: Text('Example ${items[index]['subtitle']}'),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => JournalEntryScreen(
                    toggleTheme: toggleTheme,
                    journalEntryFields: JournalEntryField(
                      title: '${items[index]['title']}',
                      body: '${items[index]['body']}',
                      dateTime: DateTime.now(),
                      rating: index
                    ),
                  )
                )
              );
            }
          );
      }),
    );
  }
}