import 'package:flutter/material.dart';
import 'package:vinove_demo/View/members_list_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff4434A7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  NetworkImage("" // Replace with actual image URL
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "User Name",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "User Email",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Attendance'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const MembersList()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart_outline),
            title: const Text('Activity'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Timesheet'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text('Report'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Jobsite'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Team'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.time_to_leave),
            title: const Text('Time off'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Schedules'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1),
            title: const Text('Request to join Organization'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('FAQ & Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version: 2.10(1)'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
