import 'package:flutter/material.dart';
import 'package:flutter_book/notes/Notes.dart';
import 'tasks/Tasks.dart';

void main() => runApp(FlutterBook());

class FlutterBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Book',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text('FlutterBook'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.date_range), text: 'Appointments'),
                  Tab(icon: Icon(Icons.contacts), text: 'Contacts'),
                  Tab(icon: Icon(Icons.note), text: 'Notes'),
                  Tab(icon: Icon(Icons.assignment_turned_in), text: 'Tasks'),
                ]
              )
            ),
            body: TabBarView(
                children: [
                  Dummy('Appointments'),
                  Dummy('Contacts'),
                  Notes(),
                  Tasks(),
                ]
            )
          )
      )
    );
  }
}

class Dummy extends StatelessWidget {
  final String _title;

  Dummy(this._title);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(_title));
  }
}