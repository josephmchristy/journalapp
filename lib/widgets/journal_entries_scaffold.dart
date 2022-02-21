import 'package:flutter/material.dart';

class JournalEntriesScaffold extends StatelessWidget {

  JournalEntriesScaffold({ Key? key }) : super(key: key);

   final items = List<Map>.generate(1000, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
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
          );
      }),
    );
  }
}