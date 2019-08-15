import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.blue))),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('smartwaistbag'),
        centerTitle: true,
      ),
      body: new GridView.count(
        crossAxisCount: 3,
        children: new List<Widget>.generate(6, (index) {
          return new GridTile(
            child: new Card(
                color: Colors.blue.shade200,
                child: new Center(
                  child: new Text('tile $index'),
                )
            ),
          );
        }),
      ),
    );
  }
}

