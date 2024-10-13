import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vinove_demo/map_screen.dart';
import 'package:vinove_demo/members_screen.dart';
import 'package:vinove_demo/route_screen.dart';
import 'member_location_screen.dart';


class MenuScreen extends StatefulWidget {
  @override

  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATTENDANCE"),
        backgroundColor: Color(0xff4434A7),
        titleSpacing: -8,
        elevation: 0,
      ),
      drawer: Visibility(
        visible: true,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff4434A7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      NetworkImage( ""// Replace with actual image URL
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Shakshi",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Shakshi@gmail.com",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.timer),
                title: Text('Timer'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Attendance'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.pie_chart_outline),
                title: Text('Activity'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Timesheet'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.report),
                title: Text('Report'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Jobsite'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Team'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.time_to_leave),
                title: Text('Time off'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Schedules'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person_add_alt_1),
                title: Text('Request to join Organization'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('FAQ & Help'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Policy'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Version: 2.10(1)'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
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
                    color: Color(0xffEAF0F6),
                    // Set the background color here
                    shape: BoxShape
                        .circle, // Shape of the button (you can also use BoxShape.rectangle for rectangular buttons)
                  ),
                  child: IconButton(
                      padding: EdgeInsets.only(left: 1),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffC9C5FF)),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => MembersScreen()));
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
          Row(
            children: [
              Spacer(),
              Text(
                "Tue, Aug 31 2022",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.calendar_month),
              ),
            ],
          ),
          Divider(),
          Expanded(
            flex: 11,
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                Divider(
                  color: Colors.black,
                  thickness: 1,
                );
                return Column(
                  children: [
                    ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              NetworkImage(""),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(members[index].name),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           RouteScreen(
                                //               memberId: members[index].id)),
                                // );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.location_on),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LocationScreen(
                                              memberId: members[index].id)),
                                );
                              },
                            ),
                          ],
                        )
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    )
                  ],
                );
              },
            ),
          ),
          Divider(),

          // Show Map view button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Show Map View",
                  style: TextStyle(
                      color: Color(0xff624DE3),
                      fontSize: 18
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapScreen()));
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: Color(0xff624DE3),
              ),
            ],
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

