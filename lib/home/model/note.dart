class Note {
  int id;
  final String header;
  final int note;

  Note(this.header, this.note);

  /*Note.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        header = res["name"],
        note = res["note"];*/

  Note.fromMap(Map<String, dynamic> res)
      : header = res["header"],
        note = res["note"];

  Map<String, Object> toMap() {
    //return {'id': id, 'header': header, 'note': note};
    return {'header': header, 'note': note};
  }
}
