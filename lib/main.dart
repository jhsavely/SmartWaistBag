import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'SettingsScreen.dart';

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
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('smartwaistbag'),
          centerTitle: true,
          leading: IconButton(
              icon: Image.asset(
                'images/logo_001.png',
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
        body: MenuLayout());
  }
}

class MenuLayout extends StatelessWidget {
  final text = new Text('Text here', style: new TextStyle(fontSize: 20.0));
  final margin =
      const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0);
  final backColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width
    return Scaffold(
      body: SafeArea(
        //I didn't add appbar. this will add necessary padding for status bar.
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //width: width / 1.5,
                // this will give you flexible width not fixed width
                //margin: margin,
                //color: backColor,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                        alignment: Alignment.topCenter,
                        child: text, //variable above
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        alignment: Alignment.topCenter,
                        child: text, //variable above
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.topCenter,
                        child: text, //variable above
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                //width: width / 1.5,
                // this will give you flexible width not fixed width
                //margin: margin,
                //variable
                color: Colors.grey, //variable
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indication extends StatefulWidget {
  @override
  _IndicationState createState() => _IndicationState();
}

class _IndicationState extends State<Indication> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
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
