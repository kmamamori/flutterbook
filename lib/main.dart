import 'package:flutter/material.dart';
import 'package:flutterbook/notes/Notes.dart';
import 'package:scoped_model/scoped_model.dart';

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
                    title: Text('Ken Amamori'),
                    bottom: TabBar(tabs: [
                      Tab(icon: Icon(Icons.date_range), text: 'Appointments'),
                      Tab(icon: Icon(Icons.contacts), text: 'Contacts'),
                      Tab(icon: Icon(Icons.note), text: 'Notes'),
                      Tab(
                          icon: Icon(Icons.assignment_turned_in),
                          text: 'Tasks'),
                    ])),
                body: TabBarView(children: [
                  Dummy('Appointments'),
                  Dummy('Contacts'),
                  Notes(),
                  Task()
                ]))));
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

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Model')),
      body: ScopedModel<ConfigModel>(
        model: ConfigModel(),
        child: Column(
          children: <Widget>[ScopedModelUpdater(), ScopedModelText()],
        ),
      ),
    );
  }
}

class ConfigModel extends Model {
  Color _color = Colors.purple;
  var _text = 'April 14';

  Color get color => _color;

  get text => _text;

  void setText(var text) {
    _text = text;
    notifyListeners();
  }

  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }
}

class ScopedModelUpdater extends StatelessWidget {
  static const _colors = const [Colors.purple, Colors.pink, Colors.blue];
  static const _texts = const ['April 14', 'CS4381', 'Scope example'];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ConfigModel>(
        builder: (BuildContext context, Widget child, ConfigModel config) =>
            DropdownButton(
                value: config.color,
                items: _colors
                    .map((Color color) => DropdownMenuItem(
                          value: color,
                          child:
                              Container(width: 100, height: 20, color: color),
                        ))
                    .toList(),
                onChanged: (Color color) {
                  config.setColor(color);
                  if (color == Colors.purple) {
                    config.setText(_texts[0]);
                  } else if (color == Colors.pink) {
                    config.setText(_texts[1]);
                  } else if (color == Colors.blue) {
                    config.setText(_texts[2]);
                  }
                }));
  }
}

class ScopedModelText extends StatelessWidget {
  ScopedModelText();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ConfigModel>(
        builder: (BuildContext context, Widget child, ConfigModel config) =>
            Text(config.text, style: TextStyle(color: config.color)));
  }
}
