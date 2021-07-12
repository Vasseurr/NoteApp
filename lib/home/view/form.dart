import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/service/repository.dart';
import 'package:note_padd/home/view/home_page.dart';

import '../../locator.dart';

class _NoteDTO {
  String header = '';
  int note;
}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _NoteDTO _data = new _NoteDTO();

  var _repository = locator<Repository>();
  /*String _validateHeader(String value) {

    return null;
  }*/

  String _validateNote(int value) {
    if (value < 0 || value > 100) {
      return 'The note must be between 0 and 100.';
    }
    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      //_formKey.currentState.save();
      _repository.addNote(new Note(_data.header, _data.note));
      print('Printing the input fields.');
      print('Header: ${_data.header}');
      print('Note: ${_data.note}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: new AppBar(title: new Text('Add Note')),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(
                      hintText: 'Note1', labelText: 'Note header'),
                  //validator: this._validateHeader,
                  onSaved: (String value) {
                    this._data.header = value;
                  }),
              new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      hintText: '100', labelText: 'Enter note'),
                  //validator: this._validateNote,
                  onSaved: (String value) {
                    this._data.note = int.parse(value);
                  }),
              new Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Add',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      //_formKey.currentState.save();
                      _repository.addNote(new Note(_data.header, _data.note));
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new HomePage()));
                    }
                  },
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
