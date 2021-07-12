import 'package:note_padd/home/model/note.dart';

abstract class ServiceBase {
  Future<int> addNote(Note note);
  Future<List<Note>> retrieveNotes();
  Future<void> deleteNote(int id);
}
