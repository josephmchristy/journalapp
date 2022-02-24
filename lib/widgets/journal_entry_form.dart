import 'package:flutter/material.dart';
import 'package:journalapp/db/database_manager.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';

class JournalEntryForm extends StatefulWidget {

  final void Function() loadJournal;

  const JournalEntryForm({ Key? key, required this.loadJournal }) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  
  final formKey = GlobalKey<FormState>();
  int dropdownValue = 1;
  final journalEntryFields = JournalEntryFieldDTO(
    title: "",
    body: "",
    rating: 1,
    dateTime: DateTime.now().toString()
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleField(context),
            const SizedBox(height: 10),
            bodyField(context),
            const SizedBox(height: 10),
            ratingDropDown(context),
            const SizedBox(height: 10),
            saveCancelButtons(context, widget.loadJournal),
          ],
        ),
      )
    );
  }

  Widget titleField(BuildContext context){
    return TextFormField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder()
        ),
        onSaved: (value) {
          journalEntryFields.title = value as String;
          journalEntryFields.dateTime = DateTime.now().toString();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a title';
          } else {
            return null;
          }
        },
      );
  }

  Widget bodyField(BuildContext context){
    return TextFormField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Enter body text here!',
          border: OutlineInputBorder()
        ),
        onSaved: (value) {
          journalEntryFields.body = value as String;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter body text';
          } else {
            return null;
          }
        },
      );
  }

  Widget ratingDropDown(context) {
    return DropdownButtonFormField (
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      decoration: const InputDecoration(
          labelText: 'Rating',
          border: OutlineInputBorder()
      ),
      items: <int>[1, 2, 3, 4, 5]
      .map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString())
        );
      }).toList(), 
      onChanged: (value) {
        setState((){
          dropdownValue = value as int;
        });
      },
      onSaved: (value) {
        journalEntryFields.rating = value as int;
      },
    );
  }

  Widget saveCancelButtons(context, loadJournal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        saveButton(context, loadJournal),
        cancelButton(context)
      ],
    );
  }

  Widget saveButton(context, loadJournal) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          final databaseManager = DatabaseManager.getInstance();
          databaseManager.saveJournalEntry(journalEntryFields);
          // var db = await openDatabase(
          //   'journal.sqlite3.db', 
          //   version: 1, 
          //   onCreate: (Database db, int version) async {
          //     await db.execute(await rootBundle.loadString(DB_KEY_PATH));
          //   }
          // );

          // await databaseManager.db.transaction((txn) async {
          //   await txn.rawInsert('INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)',
          //     [journalEntryFields.title, journalEntryFields.body, journalEntryFields.rating, journalEntryFields.dateTime]
          //   );
          // });

          Navigator.restorablePopAndPushNamed(context, '/');
        }
      },
      child: const Text('Save Entry')
    );
  }

    Widget cancelButton(context) {
    return ElevatedButton(
      onPressed: () {
          Navigator.pop(context);
      },
      child: const Text('Cancel')
    );
  }

}