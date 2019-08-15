import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'smartwaistbag';

    return MaterialApp(
      title: title,
      theme: new ThemeData(
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.blue))),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(title),
          centerTitle: true,
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generates  widgets that display their index in the List.
          children: List.generate(15, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}
