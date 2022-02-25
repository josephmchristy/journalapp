// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:journalapp/db/database_manager.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';
import 'package:journalapp/screens/new_entry.dart';
import 'package:journalapp/widgets/journal_entries.dart';
import 'package:journalapp/widgets/journal_entries_horizontal.dart';
import 'package:journalapp/widgets/journal_entry.dart';
import 'package:journalapp/widgets/user_preferences.dart';
import 'package:journalapp/widgets/welcome_screen_widget.dart';


class JournalEntryListScreen extends StatefulWidget {

  static const routeKey = 'journal_entries';
  final void Function(bool) toggleTheme;

  

  const JournalEntryListScreen({ Key? key, required this.toggleTheme  }) : super(key: key);

  @override
  State<JournalEntryListScreen> createState() => JournalEntryListScreenState();
}

class JournalEntryListScreenState extends State<JournalEntryListScreen> {

  late List<JournalEntryFieldDTO> journalEntries = [];
  late int journalSelected = 0;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    journalEntries = await databaseManager.journalEntries();
    
    setState((){
      journalEntries = journalEntries;
    });
  }

  void selectJournal(int journalSelectedTap) {
    setState(() {
      journalEntries = journalEntries;
      journalSelected = journalSelectedTap;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: journalEntries.isEmpty ? const Text('Welcome') : const Text('Journal App'),
        actions:[
          Builder(builder: (context) => IconButton(
            icon: (const Icon(Icons.settings)),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          )
        ],
        leading: Container(),
      ),
      endDrawer: UserPreferencesDrawer(toggleTheme: widget.toggleTheme),
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
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 500 ? verticalLayout(context, widget.toggleTheme, journalEntries) : horizontalLayout(context, widget.toggleTheme, journalEntries);
      },)
    );
  }

  Widget verticalLayout(BuildContext context, toggleTheme, journalEntries) {
    return journalEntries.isEmpty ? const WelcomeScreenWidget() : 
    Column(
        children: [
          JournalEntries(toggleTheme: toggleTheme, journalEntries: journalEntries),
        ],
    );
  }

  Widget horizontalLayout(BuildContext context, toggleTheme, journalEntries){
    return journalEntries.isEmpty ? const WelcomeScreenWidget() : 
    Row( 
      children: [
        Flexible(
          child: Column(
            children: [
              JournalEntriesHorizontal(toggleTheme: toggleTheme, journalEntries: journalEntries)
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              JournalEntry(
                journalEntryFields: journalEntries[journalSelected],
              )
            ],
          ),
        ),
      ]
    );
  }
}