import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final dynamic data;

  const AccountScreen({Key? key, required this.data}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState(data: data);
}

class _AccountScreenState extends State<AccountScreen> {
  final dynamic data;
  final Color customColor = const Color(0xFF666666);
  final Color appColor = const Color(0xFF64C9AC);
  _AccountScreenState({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: customColor,
              // backgroundImage: NetworkImage(data["profileImage"]),
            ),
            SizedBox(height: 20),
            Text(
              '${data["fullName"]}',
              style: TextStyle(
                  fontSize: 20, color: Colors.black), // Change text color
            ),
            SizedBox(height: 10),
            Text(
              '${data["email"]}',
              style: TextStyle(
                  fontSize: 12, color: Colors.black), // Change text color
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              text: 'Edit Profile',
              icon: Icons.edit,
              onTap: () {
                // Implement Edit Profile logic here
              },
              cardColor: customColor, // Change card color
              textColor: Colors.white, // Change text color
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              text: 'Sign Out',
              icon: Icons.logout,
              onTap: () {
                // Implement Sign Out logic here
              },
              cardColor: customColor, // Change card color
              textColor: Colors.white, // Change text color
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
      {required String text,
      required IconData icon,
      required Function() onTap,
      required Color cardColor,
      required Color textColor}) {
    return Card(
      color: cardColor, // Change card color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Row(
          children: [
            Icon(icon, size: 20, color: textColor), // Change icon color
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  fontSize: 14, color: textColor), // Change text color
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right,
            size: 20, color: textColor), // Change icon color
        onTap: onTap,
      ),
    );
  }
}
