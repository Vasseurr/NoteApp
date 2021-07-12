import 'package:flutter/material.dart';
import 'package:note_padd/home/model/note.dart';
import 'package:note_padd/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _viewModel = locator<HomeViewModel>();
  List<Note> noteList = <Note>[
    new Note(0, 'note 1', 100),
    new Note(1, 'note 2', 50),
    new Note(2, 'note 3', 75)
  ];

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
                      height: 50,
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          Text(noteList[index].header +
                              " - " +
                              noteList[index].note.toString()),
                          RaisedButton(
                            onPressed: () {
                              deleteNote(index);
                            },
                          )
                        ],
                        //child: Text('${noteList[header]} - ${noteList[note]}'),
                      ));
                },
                itemCount: noteList.length);
          } else {
            return Container();
          }
        },
        future: getAllNotes(),
      ),
    );
  }

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
}
