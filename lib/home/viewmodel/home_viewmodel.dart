import 'package:flutter/cupertino.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/service/repository.dart';
import 'package:note_padd/locator.dart';

class HomeViewModel extends ChangeNotifier {
  var _repository = locator<Repository>();

  List<Note> notes = [];

  Future<List<Note>> getAllNotes() async {
    var response = await _repository.retrieveNotes();
    for (var i = 0; i < response.length; i++) {
      if (notes.length < response.length) {
        notes.add(new Note(response[i].header, response[i].note));
      }
    }
    return notes;
  }

  Future<void> deleteNote(int id) async {
    _repository.deleteNote(id);
  }

  Future<List<Note>> addNote(Note note) async {
    _repository.addNote(note);
  }
}
