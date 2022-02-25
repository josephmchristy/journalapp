// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';
import 'package:journalapp/screens/journal_entry_list.dart';


class JournalEntriesHorizontal extends StatelessWidget {

  final void Function(bool) toggleTheme;
  late List<JournalEntryFieldDTO> journalEntries = []; 


  JournalEntriesHorizontal({ Key? key, required this.toggleTheme, required this.journalEntries }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    JournalEntryListScreenState? appState = context.findAncestorStateOfType<JournalEntryListScreenState>();

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: journalEntries.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return ListTile(
            leading: IconTheme(
              data: const IconThemeData(color: Colors.white),
              child: appState!.journalSelected == index ? const Icon(Icons.markunread_rounded) : const Icon(Icons.markunread_outlined)
            ), 
            title: Text('Journal Entry ${journalEntries[index].title}'),
            subtitle: Text('Example ${journalEntries[index].body}'),
            onTap: () {
              appState.selectJournal(index);
            }
          );
      }),
    );
  }
}