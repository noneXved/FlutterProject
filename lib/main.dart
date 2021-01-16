import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  int _number = 0;
  
  void _add () {
    setState(() {
      _number++;
    });
  }

  void _sub () {
    setState(() {
      _number--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Value = $_number'),
              new IconButton(icon: new Icon(Icons.add),  onPressed: _add),
              new IconButton(icon: new Icon(Icons.remove),  onPressed: _sub)
            ],
          ),
        ),
      ),
    );
  }
}
