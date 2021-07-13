import 'package:flutter/material.dart';
import 'package:note_padd/core/base/view/base_view.dart';
import 'package:note_padd/core/constants/navigations.dart';
import 'package:note_padd/core/init/navigation/navigation_service.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        await model.getAllNotes();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Notes"),
            automaticallyImplyLeading: false,
          ),
          body: model.state == HomeViewState.IDLE
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white54,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.note, size: 70),
                                title: Text(model.notes[index].header,
                                    style: TextStyle(color: Colors.black)),
                                subtitle: Text(
                                    model.notes[index].note.toString(),
                                    style: TextStyle(color: Colors.black)),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    model.deleteNote(index);
                                  },
                                  child: Text('Delete',
                                      style:
                                          TextStyle(color: Colors.redAccent))),
                            ],
                          ),
                        ));
                  },
                  itemCount: model.notes.length)
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            onPressed: () => NavigationService.instance
                .navigateToPage(path: NavigationConstants.FORM),
          ),
        );
      },
    );
  }
}
