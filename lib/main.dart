import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'SettingsScreen.dart';
import 'MapScreen.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
  const StaggeredTile.count(3, 4.2),
];

List<Widget> _tiles = const <Widget>[
  const _SettingsTile(Colors.grey, Icons.fingerprint),
  const _MapTile(Colors.grey, Icons.map),
  const _SettingsTile(Colors.grey, Icons.book),
  const _SettingsTile(Colors.grey, Icons.lock),
  const _SettingsTile(Colors.grey, Icons.alarm),
  const _SettingsTile(Colors.grey, Icons.settings),
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
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Container(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Container(
                    // width: 20,
                    //height: 30,
                    child: Text('smartwaistbag',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
              ),
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
//  final margin =
//      const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0);

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width
    return Container(
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(children: [
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
                ),
              ],
            ),
          ),
        ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xAA00ff00),Color(0xffffffff)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp
          )

      ),
    );
  }
}

Widget _bagChargeIndicator() {
  return Expanded(
    child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white12,
        child: Card(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            // Text('Bag charge', style: TextStyle(fontSize: 10.0)),
                  Container(
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.green.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Container(
                          // width: 20,
                          //height: 30,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: new LinearPercentIndicator(
                              width: 170.0,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 20.0,
                              leading: new Text("Bag"),
                              // trailing: new Text("right content"),
                              percent: 0.34,
                              center: Text("34.0%"),
                              linearStrokeCap: LinearStrokeCap.butt,
                              progressColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(boxShadow: [
                      new BoxShadow(
                        color: Colors.green,
                        blurRadius: 10.0,
                      ),
                    ]),
                  ),
              ]),
        ),
    ),
  );
}

Widget _wireLessIndicator() {
  return Expanded(
    child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white12,
        child: Card(
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                Image.asset(
                  'images/bluetooth_1.png',
                  fit: BoxFit.contain,
                  height: 56,
                ),
                Text(
                  'Wireless',
                  style: TextStyle(fontSize: 10.0),
                ),
                Image.asset(
                  'images/gsm_2.png',
                  fit: BoxFit.contain,
                  height: 56,
                ),
//            Container(
//              child: Card(
//                child: InkWell(
//                  splashColor: Colors.blue.withAlpha(30),
//                  onTap: () {
//                    print('Card tapped.');
//                  },
//                  child: Container(
//                    // width: 20,
//                    //height: 30,
//                    child: Row(
//                      children: <Widget>[
//
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              decoration: new BoxDecoration(boxShadow: [
//                new BoxShadow(
//                  color: Colors.green,
//                  blurRadius: 10.0,
//                ),
//              ]),
//            ),

//          Image.asset(
//            'images/gsm_1.png',
//            fit: BoxFit.contain,
//            height: 56,
//          ),
              ]),
        )),
  );
}

Widget _locationIndicator() {
  return Expanded(
    child: Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white12,
      child: Card(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Image.asset(
                    'images/wifi_1.png',
                    fit: BoxFit.contain,
                    height: 56,
                  ),
                  Image.asset(
                    'images/gps_1.png',
                    fit: BoxFit.contain,
                    height: 56,
                  ),
                ]
       ),
      ),
    ),
  );
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile(this.backgroundColor, this.iconData);

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

class _MapTile extends StatelessWidget {
  const _MapTile(this.backgroundColor, this.iconData);

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
            MaterialPageRoute(builder: (context) => new MapScreen()),
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
//
//Widget _buildBox({int points, Color color, Color textColor = Colors.white}) {
//  return Expanded(
//    flex: points,
//    child: Container(
//      constraints: BoxConstraints.expand(),
//      color: color,
//      child: Center(
//        child: Text(
//          '$points',
//          style: TextStyle(fontSize: 32.0, color: textColor),
//        ),
//      ),
//    ),
//  );
//}
