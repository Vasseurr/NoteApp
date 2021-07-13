import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/service/service_base.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Service with ServiceBase {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, header TEXT NOT NULL, note INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  @override
  Future<int> addNote(Note note) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('notes', note.toMap());
    return result;
  }

  @override
  Future<List<Note>> retrieveNotes() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('notes');
    return result.map((e) => Note.fromMap(e)).toList();
  }

  @override
  Future<int> deleteNote(int id) async {
    final db = await initializeDB();
    return await db.delete('notes', where: '$id = ?', whereArgs: [id]);

    /* db.delete(
      'notes',
      where: "id = ?",
      whereArgs: [id],
    );*/
  }
}
