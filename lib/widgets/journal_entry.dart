import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';

class JournalEntry extends StatelessWidget {

  final JournalEntryFieldDTO journalEntryFields;

  const JournalEntry({ Key? key,  required this.journalEntryFields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, int index){
        // return ListTile(
        //   title: Text('Journal Entry ${journalEntryFields.title}'),
        //   subtitle: Text('Example ${journalEntryFields.body}'),
        //   isThreeLine: true,
        // );
        return JournalEntryView(context);
      },
    );
  }

  Widget JournalEntryView(BuildContext context) {
    return Card(
      //padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            journalEntryFields.title,
            style: Theme.of(context).textTheme.headline4
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            journalEntryFields.dateTime,
            style: Theme.of(context).textTheme.caption
          ),
          Text(
            'Rating: ${journalEntryFields.rating.toString()}',
            style: Theme.of(context).textTheme.caption
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            journalEntryFields.title,
            style: Theme.of(context).textTheme.bodyText1
          ),
        ],
      )
    );
  }
}