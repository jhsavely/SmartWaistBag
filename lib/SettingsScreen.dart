import 'dart:convert';
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
    _getMySettings();
  }

  dispose() {
    super.dispose();
  }

  bool _lights = false;

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView.builder(
          itemCount: settings.length-1,
          itemBuilder: (context, index) {
            return Card(
              child: SwitchListTile(
                  value: _lights,
                  onChanged: (bool value) {
                    setState(() {
                      _lights = value;
                    });
                  },
                  secondary: Icon(icons[index]),
                  title: Text(settings[index].name)),
            );
          },
        ));
  }
}
