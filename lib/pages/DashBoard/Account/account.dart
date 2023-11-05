import 'package:flutter/material.dart';
import 'package:money_mate/pages/login.dart';
import 'package:money_mate/pages/DashBoard/Account/account_edit.dart';
// import 'package:money_mate/pages/Dashboard/Account Screens/edit_account.dart';
// import 'package:money_mate/pages/Login Signup Screens/login_in.dart';

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
            ),
            const SizedBox(height: 20),
            Text(
              '${data["fullName"]}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '${data["email"]}',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              text: 'Edit Profile',
              icon: Icons.edit,
              onTap: () {
                // Navigate to EditProfileScreen and pass user data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(userData: data),
                  ),
                );
              },
              cardColor: customColor,
              textColor: Colors.white,
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              text: 'Sign Out',
              icon: Icons.logout,
              onTap: () {
                // Implement Sign Out logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              cardColor: customColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String text,
    required IconData icon,
    required Function() onTap,
    required Color cardColor,
    required Color textColor,
  }) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Row(
          children: [
            Icon(icon, size: 20, color: textColor),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(fontSize: 14, color: textColor),
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, size: 20, color: textColor),
        onTap: onTap,
      ),
    );
  }
}
