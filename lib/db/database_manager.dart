// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/services.dart';
import 'package:journalapp/models/journal_entry_field_dto.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {

  static const DB_KEY_PATH = 'assets/schema_1.sql.txt';
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  static late DatabaseManager _instance;

  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, await rootBundle.loadString(DB_KEY_PATH));
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry(JournalEntryFieldDTO dto) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto.title, dto.body, dto.rating, dto.dateTime]
      );
    });
  }

  Future<List<JournalEntryFieldDTO>> journalEntries() async {
    List<Map> journalRecords = await db.rawQuery("SELECT * FROM journal_entries");
    List<JournalEntryFieldDTO> journalEntries = journalRecords.
    map((record) {
      return JournalEntryFieldDTO(
        title: record['title'], 
        body: record['body'], 
        rating: record['rating'], 
        dateTime: record['date']);
    }).toList();
    return journalEntries;
  }
}