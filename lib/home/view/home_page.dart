import 'package:flutter/material.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import 'form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* var _viewModel = locator<HomeViewModel>();
  List<Note> noteList = <Note>[
    new Note('note 1', 100),
    new Note('note 2', 50),
    new Note('note 3', 75)
  ];*/

  final _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData != null) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      height: 100,
                      width: 50,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          //color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_viewModel.notes[index].header +
                              " - " +
                              _viewModel.notes[index].note.toString()),
                          RaisedButton(
                            color: Colors.red,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _viewModel.deleteNote(index);
                            },
                          )
                        ],
                        //child: Text('${noteList[header]} - ${noteList[note]}'),
                      ));
                },
                itemCount: _viewModel.notes.length);
          } else {
            return Container();
          }
        },
        future: _viewModel.getAllNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        onPressed: () => Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyCustomForm())),
      ),
    );
  }
/*
  Future<List<Note>> getAllNotes() async {
    //noteList.add(new Note(0, 'note 1', 100));
    //noteList.add(new Note(1, 'note 2', 50));
    //noteList.add(new Note(2, 'note 3', 75));
    return noteList;
  }

  void deleteNote(int index) {
    for (int i = 0; i < noteList.length; i++) {
      if (i == index) {
        setState(() {
          noteList.removeAt(index);
          return;
        });
      }
    }
  }

  addNote() {}*/
}
