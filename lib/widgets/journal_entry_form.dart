import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {

  const JournalEntryForm({ Key? key }) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  
  final formKey = GlobalKey<FormState>();
  //final journalEntryFields = JournalEntryField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder()
              ),
              onSaved: (value) {
                //Store value in some object
                //journalEntryFields.title = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  //formKey.currentState!.save();
                   Navigator.pop(context);
                }
              },
              child: const Text('Save Entry')
            )
          ],
        ),
      )
    );
  }
}