import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journalapp/screens/journal_entry.dart';
import 'package:journalapp/models/journal_entry_field_DTO.dart';
import 'package:sqflite/sqflite.dart';

const DB_KEY_PATH = 'assets/schema_1.sql.txt';

class JournalEntries extends StatefulWidget {

  final void Function(bool) toggleTheme;

  JournalEntries({ Key? key, required this.toggleTheme }) : super(key: key);

  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
   final items = List<Map>.generate(20, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
      'body': 'Body text for $i',
      'rating': 5,
    };
  });

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    var db = await openDatabase(
      'journal.sqlite3.db', 
      version: 1, 
      onCreate: (Database db, int version) async {
        await db.execute(await rootBundle.loadString(DB_KEY_PATH));
      }
    );
    List<Map> journalRecords = await db.rawQuery("SELECT * FROM journal_entries");
    // final journalEntries = journalRecords.map((record) {
    //   journa
    // });
    setState((){});
  }

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
                    toggleTheme: widget.toggleTheme,
                    journalEntryFields: JournalEntryFieldDTO(
                      title: '${items[index]['title']}',
                      body: '${items[index]['body']}',
                      dateTime: DateTime.now(),
                      rating: index.toString()
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