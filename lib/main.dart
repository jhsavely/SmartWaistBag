import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'API.dart';
import 'User.dart';

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
  const _MyTile(Color(0xDDF1F5AA), Icons.battery_alert),
  const _MyTile(Color(0xDDF1F5AA), Icons.wifi),
  const _MyTile(Color(0xDDF1F5AA), Icons.bluetooth),
  const _MyTile(Color(0xDDF1F5AA), Icons.fingerprint),
  const _MyTile(Color(0xDDF1F5AA), Icons.map),
  const _MyTile(Color(0xDDF1F5AA), Icons.book),
  const _MyTile(Color(0xDDF1F5AA), Icons.lock),
  const _MyTile(Color(0xDDF1F5AA), Icons.alarm),
  const _MyTile(Color(0xDDF1F5AA), Icons.settings),
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


class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xCFE2F3AA),
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
            MaterialPageRoute(builder: (context) => new ThirdScreen()), //TODO:solve problem with called class from another file
          );
        },
//        {
//          final snackBar = SnackBar(content: Text("Tap"));
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

final String assetName = 'images/user_profile_3.svg';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("On the next Screen"),
      ),
      body: Center(
        child: new Container(
          width: 200,
          height: 200,
          child: RaisedButton(
            elevation: 8,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
            child: SvgPicture.asset(assetName, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}



class ThirdScreen extends StatefulWidget{
  @override
  createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        ));
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
