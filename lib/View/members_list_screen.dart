import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vinove_demo/View/map_screen.dart';
import 'package:vinove_demo/View/members_screen.dart';
import 'package:vinove_demo/View/menu_drawer.dart';
import 'package:vinove_demo/models/user_data.dart';
import 'member_location_screen.dart';


class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override

  _MembersListState createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  UserService userService = UserService();
  List<LogedInUser> loggedInMembers = [];

  @override
  void initState() {
    super.initState();
    fetchLoggedInUsers();
  }

  Future<void> fetchLoggedInUsers() async {
    List<LogedInUser> members = await userService.getLoggedInUsers();
    print('Fetched Members: ${members.length}'); //extra
    setState(() {
      loggedInMembers = members;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ATTENDANCE"),
        backgroundColor: const Color(0xff4434A7),
        titleSpacing: -8,
        elevation: 0,
      ),
      drawer: Visibility(
        visible: true,
        child: AppDrawer()
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade200,
              child: Row(children: [
                const SizedBox(
                  width: 18,
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xffEAF0F6),
                    // Set the background color here
                    shape: BoxShape
                        .circle, // Shape of the button (you can also use BoxShape.rectangle for rectangular buttons)
                  ),
                  child: IconButton(
                      padding:const EdgeInsets.only(left: 1),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xffC9C5FF)),
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (
                        //     context) =>const MembersScreen()));
                      },
                      icon:const Icon(
                        Icons.groups,
                        color: Colors.white,
                        size: 25,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "All Members",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 115,
                ),
                TextButton(
                    onPressed: () {},
                    child:const Text(
                      "Change",
                      style: TextStyle(fontSize: 16),
                    ))
              ]),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child:const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            flex: 11,
            child: ListView.builder(
              itemCount: loggedInMembers.length,
              itemBuilder: (context, index) {
                const Divider(
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
                              backgroundImage: loggedInMembers[index].image != null && loggedInMembers[index].image.isNotEmpty
                                  ? NetworkImage(loggedInMembers[index].image)
                                  : const NetworkImage('https://cdn-icons-png.flaticon.com/512/847/847969.png'),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(loggedInMembers[index].name),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon:const Icon(Icons.calendar_today),
                              onPressed: () {
                              },
                            ),
                            IconButton(
                              icon:const Icon(Icons.location_on, color: Color(0xff4434A7),),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LocationScreen(
                                              memberId: loggedInMembers[index].uuid)),
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
          const Divider(),

          // Show Map view button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
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
                icon: const Icon(Icons.arrow_forward_ios),
                color: const Color(0xff624DE3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch logged-in users from Firestore
  Future<List<LogedInUser>> getLoggedInUsers() async {
    try {
      // Assuming users have a field 'isLoggedIn' set to true
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .get();

      // Map the Firestore data to Member objects
      List<LogedInUser> members = querySnapshot.docs.map((doc) {
        return LogedInUser.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return members;
    } catch (e) {
      print('Error: $e'); // 👈 Add this
      return [];
    }
  }
}


