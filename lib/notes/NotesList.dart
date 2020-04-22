import 'package:flutter/material.dart';
import 'package:flutterbook/notes/NotesModel.dart';
import "package:scoped_model/scoped_model.dart";

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NotesModel>(
        builder: (BuildContext context, Widget child, NotesModel model) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                model.noteBeingEdited = Note();
                model.setColor(null);
                model.setStackIndex(1);
              }),
          body: ListView.builder(
              itemCount: model.noteList.length,
              itemBuilder: (BuildContext context, int index) {
                Note note = model.noteList[index];
                Color color;
                switch (note.color) {
                  case "red":
                    color = Colors.red;
                    break;
                  case "green":
                    color = Colors.green;
                    break;
                  case "blue":
                    color = Colors.blue;
                    break;
                  case "yellow":
                    color = Colors.yellow;
                    break;
                  case "grey":
                    color = Colors.grey;
                    break;
                  case "purple":
                    color = Colors.purple;
                    break;
                  default:
                    color = Colors.white;
                    break;
                }
                return Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Card(
                        elevation: 8,
                        color: color,
                        child: ListTile(
                          title: Text(note.title),
                          subtitle: Text(note.content),
                          onTap: () {
                            model.noteBeingEdited = note;
                            model.setColor(model.noteBeingEdited.color);
                            model.setStackIndex(1);
                          },
                        )));
              }));
    });
  }
}
