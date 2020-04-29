import 'package:flutter/material.dart';
import 'notes/Notes.dart';
import 'package:path_provider/path_provider.dart';
import 'appointments/Appointments.dart';
import 'contacts/Avatar.dart';
import 'contacts/Contacts.dart';
import 'tasks/Tasks.dart';

void main() {
  startMeUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Avatar.docsDir = await getApplicationDocumentsDirectory();
    runApp(FlutterBook());
  }
  startMeUp();
}

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
              title: Text('Ken Amamori'),
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
                  Appointments(),
                  Contacts(),
                  Notes(),
                  Tasks(),
                ]
            )
          )
      )
    );
  }
}