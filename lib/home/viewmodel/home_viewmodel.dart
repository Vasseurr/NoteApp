import 'package:flutter/cupertino.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/service/repository.dart';
import 'package:note_padd/locator.dart';

enum HomeViewState { IDLE, BUSY }

class HomeViewModel extends ChangeNotifier {
  HomeViewState _state;

  HomeViewState get state => _state;

  HomeViewModel() {
    _state = HomeViewState.IDLE;
  }

  set state(HomeViewState value) {
    _state = value;
    notifyListeners();
  }

  var _repository = locator<Repository>();

  List<Note> notes = [];

  Future<List<Note>> getAllNotes() async {
    state = HomeViewState.BUSY;

    var response = await _repository.retrieveNotes();
    for (var i = 0; i < response.length; i++) {
      if (notes.length < response.length) {
        notes.add(new Note(response[i].header, response[i].note));
      }
    }
    state = HomeViewState.IDLE;

    return notes;
  }

  Future<void> deleteNote(int id) async {
    await _repository.deleteNote(id);
    var reference = notes.removeAt(id);
    notes.remove(reference);
    notifyListeners();
  }

  Future<List<Note>> addNote(Note note) async {
    _repository.addNote(note);
  }
}
