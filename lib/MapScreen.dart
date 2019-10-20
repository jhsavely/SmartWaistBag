import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  //var location = new Location();
  Map<String, double> userLocation;
  final LatLng _center = const LatLng(50.454778, 30.523868);
  static const five_second = const Duration(seconds: 5);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> myMarkers = [];

  @override
  initState() {
    super.initState();
    myMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () async {
          print('Marker Tapped');
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: _center));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Map App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: Set.from(myMarkers),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),
          backgroundColor: Colors.green[700],
          onPressed: () {
            setLocation();
          },
          tooltip: 'My Position',
        ),
      ),
    );
  }

  void setLocation() {
    _getLocation().then((value) {
      setState(() {
        myMarkers.clear();
        userLocation = value;
        print(userLocation.toString());
        LatLng myGeoPos =
        LatLng(userLocation["latitude"], userLocation["longitude"]);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: myGeoPos, zoom: 15.0)));
        myMarkers.add(Marker(
            markerId: MarkerId('myMarker'),
            icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            draggable: false,
            onTap: () async {
              print('Marker Tapped');
            },
            position: myGeoPos,
            infoWindow: InfoWindow(
              title: "You",
            )));
      });
    });
    new Timer(five_second, setLocation);
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
//      await location.getLocation().then((onValue) {
//        print(onValue.toString());
//        currentLocation = onValue;
//      });
    } catch (ex) {
      print(ex);
      currentLocation = null;
      if (ex.code == 'PERMISSION_DENIED') {
        print('PERMISSION DENIED');
      }
    }
    return currentLocation;
  }
}
