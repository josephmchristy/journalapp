import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journalapp/models/journal_entry_field_DTO.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/widgets/journal_entries.dart';
import 'package:journalapp/widgets/user_preferences.dart';
import 'package:sqflite/sqflite.dart';

const DB_KEY_PATH = 'assets/schema_1.sql.txt';


class JournalEntryListScreen extends StatefulWidget {

  static const routeKey = 'journal_entries';
  final void Function(bool) toggleTheme;
  

  const JournalEntryListScreen({ Key? key, required this.toggleTheme  }) : super(key: key);

  @override
  State<JournalEntryListScreen> createState() => JournalEntryListScreenState();
}

class JournalEntryListScreenState extends State<JournalEntryListScreen> {

  late List<JournalEntryFieldDTO> journalEntries = [];

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
    journalEntries = journalRecords.map((record) {
        return JournalEntryFieldDTO(
          title: record['title'], 
          body: record['body'], 
          rating: record['rating'], 
          dateTime: record['date']);
      }).toList();
    
    setState((){
      journalEntries = journalEntries;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(journalEntries == null){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading')
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ) 
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: journalEntries.isEmpty ? const Text('Welcome') : const Text('Journal App'),
          leading: Builder(
          builder: (context) => IconButton(
            icon: (const Icon(Icons.settings)),
            onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: UserPreferencesDrawer(toggleTheme: widget.toggleTheme),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => NewEntryScreen(toggleTheme: widget.toggleTheme, loadJournal: loadJournal,))
            );
          },
        ),
        body: journalEntries.isEmpty ? const Text('Welcome') : Column(
          children: [
            JournalEntries(toggleTheme: widget.toggleTheme, journalEntries: journalEntries),
          ],
        )
      );
    }
  }
}