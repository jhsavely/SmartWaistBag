import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'SettingsScreen.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
];

List<Widget> _tiles = const <Widget>[
  const _MyTile(Colors.grey, Icons.fingerprint),
  const _MyTile(Colors.grey, Icons.map),
  const _MyTile(Colors.grey, Icons.book),
  const _MyTile(Colors.grey, Icons.lock),
  const _MyTile(Colors.grey, Icons.alarm),
  const _MyTile(Colors.grey, Icons.settings),
];



void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text('smartwaistbag'),
              centerTitle: true,
              leading: IconButton(
                  icon: Image.asset(
                    'images/github_logo_256.png',
                    fit: BoxFit.contain,
                    height: 56,
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('A SnackBar!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    // Find the Scaffold in the widget tree and use it to show a SnackBar.
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
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
            body: MenuLayout()));
  }
}

class MenuLayout extends StatelessWidget {
  final margin =
      const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0);


  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _bagChargeIndicator(),
                                _wireLessIndicator(),
                              ],
                            ))
                      ]),
                    ),
                    _locationIndicator()
                  ]),
            ),
            Expanded(
              flex: 8,
              child: Padding(

                  padding: const EdgeInsets.only(top: 1.0),
                  child: new StaggeredGridView.count(

                    crossAxisCount: 9,
                    staggeredTiles: _staggeredTiles,
                    children: _tiles,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    padding: const EdgeInsets.all(1.0),
                  )
            )


//              Container(
//                //width: width / 1.5,
//                //margin: margin,
//                //variable
//                color: Colors.grey, //variable
//              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _bagChargeIndicator() {
  return Expanded(
    child: Container(
      constraints: BoxConstraints.expand(),
      color: Colors.grey,
      child: Center(
        child: Text(
          'Bag charge',
          style: TextStyle(fontSize: 10.0),
        ),
      ),
    ),
  );
}

Widget _wireLessIndicator() {
  return Expanded(

    child: Container(
      constraints: BoxConstraints.expand(),
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          'Wireless',
          style: TextStyle(fontSize: 10.0),
        ),
      ),
    ),
  );
}

Widget _locationIndicator() {
  return Expanded(
    child: Container(
      constraints: BoxConstraints.expand(),
      color: Colors.blueGrey,
      child: Column(
        children:[
          Text('Location', style: TextStyle(fontSize: 10.0),
         ),
          Icon
        ]
      ),
    ),
  );
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
            MaterialPageRoute(builder: (context) => new SettingsScreen()),
          );
        },
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


  void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Toast is shown'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

Widget _buildBox({int points, Color color, Color textColor = Colors.white}) {
  return Expanded(
    flex: points,
    child: Container(
      constraints: BoxConstraints.expand(),
      color: color,
      child: Center(
        child: Text(
          '$points',
          style: TextStyle(fontSize: 32.0, color: textColor),
        ),
      ),
    ),
  );

}
