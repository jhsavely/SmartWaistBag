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
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              title: Text('smartwaistbag'),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Charge 76%',
                  ),
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(children: [
              GridView(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0),
                children: List.generate(6, (index) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: GridTile(
                        footer: Text(
                          'Item $index',
                          textAlign: TextAlign.center,
                        ),
                        header: Text(
                          'SubItem $index',
                          textAlign: TextAlign.center,
                        ),
                        child: Icon(Icons.settings,
                            size: 40.0, color: Colors.white30),
                      ),
                    ),
                    color: Colors.blue[400],
                    margin: EdgeInsets.all(1.0),
                  );
                }),
              ),
            ])),
      ),
    );
  }
}
