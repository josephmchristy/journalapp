// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';
import 'package:journalapp/screens/journal_entry.dart';


class JournalEntries extends StatelessWidget {

  final void Function(bool) toggleTheme;
  late List<JournalEntryFieldDTO> journalEntries = []; 

  JournalEntries({ Key? key, required this.toggleTheme, required this.journalEntries }) : super(key: key);

  final items = List<Map>.generate(20, (i) {
  return {
    'title': 'Journal Entry $i',
    'subtitle': 'Subtitle text for $i',
    'body': 'Body text for $i',
    'rating': 5,
  };});


 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: journalEntries.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return ListTile(
            leading: const FlutterLogo(),
            trailing: const Icon(Icons.more_horiz),
            title: Text('Journal Entry ${journalEntries[index].title}'),
            subtitle: Text('Example ${journalEntries[index].body}'),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => JournalEntryScreen(
                    toggleTheme: toggleTheme,
                    journalEntryFields: journalEntries[index]
                    // JournalEntryFieldDTO(
                    //   title: '${items[index]['title']}',
                    //   body: '${items[index]['body']}',
                    //   dateTime: DateTime.now().toString(),
                    //   rating: index
                    // ),
                  )
                )
              );
            }
          );
      }),
    );
  }
}