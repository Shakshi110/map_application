import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteScreen extends StatelessWidget {
  final String memberId;

  RouteScreen({required this.memberId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route Details")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(30.0668, 79.0193),
              zoom: 12,
            ),
            polylines: _createRoutePolyline(),
            markers: _createStopMarkers(),
          ),
          Positioned(
            bottom: 50,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Start Location: San Francisco, CA"),
                    Text("Stop Location: Market Street"),
                    Text("Total Distance: 5 KMs"),
                    Text("Total Duration: 30 mins"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Polyline> _createRoutePolyline() {
    Set<Polyline> polylines = {
      Polyline(
        polylineId: PolylineId("route1"),
        color: Colors.blue,
        points: [
          LatLng(30.0668, 79.0193),
          LatLng(30.0668, 79.0193),
        ],
      ),
    };
    return polylines;
  }

  Set<Marker> _createStopMarkers() {
    Set<Marker> stopMarkers = {
      Marker(
        markerId: MarkerId("stop1"),
        position: LatLng(30.0668, 79.0193),
        infoWindow: InfoWindow(title: "Stop Location"),
      ),
    };
    return stopMarkers;
  }
}