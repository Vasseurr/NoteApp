import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_padd/core/base/view/base_view.dart';
import 'package:note_padd/core/constants/navigations.dart';
import 'package:note_padd/core/init/navigation/navigation_service.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/model/noteDTO.dart';
import 'package:note_padd/home/service/repository.dart';
import 'package:note_padd/home/view/home_page.dart';
import 'package:note_padd/home/viewmodel/home_viewmodel.dart';

import '../../locator.dart';

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NoteDTO _data = NoteDTO();

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
    if (_formKey.currentState.validate()) {
      //_formKey.currentState.save();
      //_repository.addNote(Note(_data.header, _data.note));
      print('Printing the input fields.');
      print('Header: ${_data.header}');
      print('Note: ${_data.note}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BaseView<HomeViewModel>(
      /*onModelReady: (model) async {
        await model.getAllNotes();
      },*/
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Add Note')),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'Note1', labelText: 'Note header'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Değer boş";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _data.header = value;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '100', labelText: 'Enter note'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Değer boş";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _data.note = int.parse(value);
                      }),
                  Container(
                    width: screenSize.width,
                    child: RaisedButton(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          model.addNote(Note(_data.header, _data.note));

                          NavigationService.instance.navigateToPage(
                              path: NavigationConstants.NOTELIST);
                        }
                      },
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
