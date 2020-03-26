import 'package:flutter/material.dart';
import 'package:sqflite_task/programs.dart';

import 'favorite_programs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/favoritePrograms': (BuildContext context) => FavoritePrograms(),
        '/programs': (BuildContext context) => Programs(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/programs');
              },
              child: Text('Programs'),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/favoritePrograms');
              },
              child: Text('Favorite programs'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
