import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'API.dart';
import 'SettingsModel.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  createState() => _SettingsScreenState();
}

final icons = [
  Icons.battery_alert,
  Icons.wifi,
  Icons.bluetooth,
  Icons.directions_car,
  Icons.fingerprint,
  Icons.directions_run,
  Icons.directions_subway,
  Icons.directions_transit,
  Icons.directions_walk
];

class _SettingsScreenState extends State {
  var settings = new List<SettingsModel>();

  _getMySettings() {
    try {
      API.getSettings().then((response) {
        setState(() {
          Iterable list = json.decode(response.body);
          settings =
              list.map((model) => SettingsModel.fromJson(model)).toList();
        });
      });
    } catch (e) {
      print("error is: $e");
    }
  }

  initState() {
    super.initState();
    //_getMySettings();
  }

  dispose() {
    super.dispose();
  }

  bool _lights = false;

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //changes color of arrow back button
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
        title: Text("Settings",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            )),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("Any Text"),
            subtitle: Text("some other text"),
          ),
        );
      }),
    );
  }
}
//
//SwitchListTile(
//value: _lights,
//onChanged: (bool value) {
//setState(() {
//_lights = value;
//});
//},
//secondary: Icon(icons[index]),
//title: Text(settings[index].name)),
