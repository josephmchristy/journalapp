import 'package:flutter/material.dart';
import 'package:journalapp/models/journal_entry_field_DTO.dart';
import 'package:sqflite/sqflite.dart';

class JournalEntryForm extends StatefulWidget {

  const JournalEntryForm({ Key? key }) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  
  final formKey = GlobalKey<FormState>();
  String dropdownValue = "1";
  final journalEntryFields = JournalEntryFieldDTO(
    title: "",
    body: "",
    rating: "1",
    dateTime: DateTime.now()
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
            saveCancelButtons(context),
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
          journalEntryFields.dateTime = DateTime.now();
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
      items: <String>['1', '2', '3', '4', '5']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value)
        );
      }).toList(), 
      onChanged: (value) {
        setState((){
          dropdownValue = value as String;
        });
      },
      onSaved: (value) {
        journalEntryFields.rating = value as String;
      },
    );
  }

  Widget saveCancelButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        saveButton(context),
        cancelButton(context)
      ],
    );
  }

  Widget saveButton(context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          // var db = await openDatabase(
          //   'journal.db', version: 1, onCreate: (Database db, int version) async {
          //     await db.execute()
          //   }
          // );

          // await db.close();

          Navigator.pop(context);
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