import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vinove_demo/route_screen.dart';

class LocationScreen extends StatelessWidget {
  final String memberId;

  LocationScreen({required this.memberId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TRACK LIVE LOCATION")),
      body: Stack(
        children: [
          // Map section
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.7,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target:LatLng(30.0668, 79.0193), // Example location
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: LatLng(30.0668, 79.0193),
                ),
              },
            ),
          ),
          // DraggableScrollableSheet for the list of sites
          DraggableScrollableSheet(
            initialChildSize: 0.3, // Size when collapsed
            minChildSize: 0.3, // Minimum size
            maxChildSize: 0.8, // Size when fully expanded

            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Total Sites and Date Selector
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Sites: 10',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement date picker functionality here
                            },
                            child: Row(
                              children: [
                                Text('Tue, Aug 31 2022',
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(width: 8),
                                Icon(Icons.calendar_today, size: 18),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    // List of sites inside DraggableScrollableSheet
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 6, // Example count
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            // Reduce horizontal padding
                            leading: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.circle,
                                    size: 12, color: Color(0xff4434A7)),
                                if (index != 5)
                                  Container(
                                    height: 35,
                                    width: 2,
                                    color: Color(0xff4434A7),
                                  ),
                              ],
                            ),
                            title: Text(
                              '2715 Ash Dr. San Jose, South Dakota 83475',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Left at 08:30 am'),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => RouteScreen(memberId: members[index].id,),),);
                              },
                              icon: Icon(Icons.arrow_forward_ios),),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Member {
  String id;
  String name;

  Member({required this.id, required this.name});
}

class VisitedLocation {
  LatLng position;
  String address;
  String time;
  bool isStop;

  VisitedLocation(
      {required this.position,
        required this.address,
        required this.time,
        required this.isStop});
}

List<Member> members = [
  Member(id: "1", name: "Shakshi"),
  Member(id: "2", name: "Kavita"),
];

List<VisitedLocation> visitedLocations = [
  VisitedLocation(
      position: LatLng(37.7749, -122.4194),
      address: "Chuttmulpur",
      time: "10:00 AM",
      isStop: false),
  VisitedLocation(
      position: LatLng(37.7849, -122.4294),
      address: "Khanpur",
      time: "11:00 AM",
      isStop: true),
];