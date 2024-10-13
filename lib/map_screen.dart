import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vinove_demo/members_screen.dart';
import 'package:vinove_demo/menu_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // static const LatLng uttarakhandLatLng = LatLng(30.0668, 79.0193);
 // static final LatLng _uttrakhand = LatLng(30.0668, 79.0193);


  GoogleMapController? _mapController;
  static final LatLng _uttrakhand = LatLng(30.0668, 79.0193);
  LatLng? _currentPosition;
  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  // Function to get the user's current location
  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return; // Location services are not enabled
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return; // Permissions are denied
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return; // Permissions are permanently denied
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Update map to center at the user's current location
    _currentPosition = LatLng(position.latitude, position.longitude);

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("current_location"),
          position: _currentPosition!,
          infoWindow: InfoWindow(title: "Your Location",
          // snippet: "Lat: ${position.latitude}, Lng: ${position.longitude}",
        ),
        ),
      );
    });

    // Move the map camera to the current location
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ATTENDANCE'),
          titleSpacing: -8, // Remove default spacing between leading and title
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuScreen()));
            },
          )),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Container(
                color: Colors.grey.shade200,
                child: Row(children: [
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xffC9C5FF),
                      // Set the background color here
                      shape: BoxShape
                          .circle, // Shape of the button (you can also use BoxShape.rectangle for rectangular buttons)
                    ),
                    child: IconButton(
                        padding: EdgeInsets.only(left: 1),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffC9C5FF)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MembersScreen()));
                        },
                        icon: Icon(
                          Icons.groups,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "All Members",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 115,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(fontSize: 16),
                      ))
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 13,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _uttrakhand,
                zoom: 14,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              myLocationEnabled: true, // Shows the user's location on the map
              // myLocationButtonEnabled: true,// Adds a button to move the camera to the user's location
            ),
            ),
        ],
      ),
    );
  }
}
