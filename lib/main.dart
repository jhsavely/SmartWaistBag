import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(7, 2),
  const StaggeredTile.count(2, 4),
  const StaggeredTile.count(7, 2),
  const StaggeredTile.count(3, 5),
  const StaggeredTile.count(3, 5),
  const StaggeredTile.count(3, 5),
  const StaggeredTile.count(3, 5),
  const StaggeredTile.count(3, 5),
  const StaggeredTile.count(3, 5),
];

List<Widget> _tiles = const <Widget>[
  const _MyTile(Colors.pink, Icons.battery_alert),
  const _MyTile(Colors.lightBlueAccent, Icons.wifi),
  const _MyTile(Colors.lightBlue, Icons.bluetooth),
  const _MyTile(Colors.brown, Icons.fingerprint),
  const _MyTile(Colors.deepOrange, Icons.map),
  const _MyTile(Colors.indigo, Icons.book),
  const _MyTile(Colors.blue, Icons.lock),
  const _MyTile(Colors.green, Icons.alarm),
  const _MyTile(Colors.amber, Icons.settings),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp1(),
    );
  }
}

final String assetName = 'images/user_profile_3.svg';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('smartwaistbag'),
          centerTitle: true,
          leading: IconButton(
              icon: Image.asset(
                'images/github_logo_48.png',
                fit: BoxFit.contain,
                height: 32,
              ),
               onPressed: () => _showToast(context),
              tooltip: 'Prev'),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  'images/github_logo_256.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                onPressed: () {
                  final snackBar = SnackBar(content: Text("Tap"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                tooltip: 'Next')
          ],
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 9,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              padding: const EdgeInsets.all(9.0),
            )));
  }
}

class _MyTile extends StatelessWidget {
  const _MyTile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
//        {
//          final snackBar = SnackBar(content: Text("Tap"));
//
//          Scaffold.of(context).showSnackBar(snackBar);
//        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(1.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("On the next Screen"),
      ),
      body: Center(
        child: RaisedButton(
          elevation: 5,
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
          child: SvgPicture.asset(assetName,
              color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
