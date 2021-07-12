import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/service/service.dart';
import 'package:note_padd/home/service/service_base.dart';

import '../../locator.dart';

class Repository with ServiceBase {
  var _service = locator<Service>();

  @override
  Future<int> addNote(Note note) async {
    return await _service.addNote(note);
  }

  @override
  Future<void> deleteNote(int id) async {
    return await _service.deleteNote(id);
  }

  @override
  Future<List<Note>> retrieveNotes() async {
    return await _service.retrieveNotes();
  }
}
