class Note {
  final int id;
  final String header;
  final int note;

  Note(this.id, this.header, this.note);

  Note.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        header = res["name"],
        note = res["note"];

  Map<String, Object> toMap() {
    return {'id': id, 'header': header, 'note': note};
  }
}
