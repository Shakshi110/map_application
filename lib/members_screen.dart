import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<String> members = [
    "Mohit Malik",
    "Nitesh Pandey",
    "Vishad Sharma",
    "Vinove Kumar Shukla",
    "Maneesh Malhotra",
    "Elizabeth Swann",
    "Robert Downey",
    "Francis Diakowsky"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEMBERS"),
        backgroundColor: Color(0xff4434A7),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          // List of all members with a "All Members" section
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xffC9C5FF),
              child: Icon(Icons.groups, color: Colors.white),
            ),
            title: Text("All Members"),
          ),

          // Member list with alphabet scroll on the side
          Expanded(
            child: Stack(
              children: [
                // Member List
                ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/user_placeholder.jpg'),
                      ),
                      title: Text(members[index]),
                    );
                  },
                ),

                // Alphabet List Index
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                            .split("")
                            .map((letter) {
                          return Text(
                            letter,
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


