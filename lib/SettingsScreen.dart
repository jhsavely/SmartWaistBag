import 'dart:convert';
import 'API.dart';
import 'SettingsModel.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget{
  @override
  createState() => _SettingsScreenState();
}

final icons = [Icons.battery_alert, Icons.wifi, Icons.bluetooth, Icons.directions_car, Icons.fingerprint,
  Icons.directions_run, Icons.directions_subway, Icons.directions_transit,  Icons.directions_walk];


class _SettingsScreenState extends State {
  var settings = new List<SettingsModel>();

  _getMySettings() {
    API.getSettings().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        settings = list.map((model) => SettingsModel.fromJson(model)).toList();
      });
    });
  }


  initState() {
    super.initState();
    _getMySettings();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {//TODO: wrap with try block and catch normal exceptions
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context, index) {
            // return ListTile(title: Text(settings[index].name));
            return Card(
              child:ListTile(
                  leading: Icon(icons[index]),
                  title: Text(settings[index].name)) ,
            );
          },
        ));
  }
}