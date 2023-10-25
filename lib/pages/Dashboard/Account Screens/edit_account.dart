import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:money_mate/pages/Dashboard/Account Screens/account.dart';
import 'dart:convert';

class EditProfileScreen extends StatefulWidget {
  final dynamic userData;

  EditProfileScreen({required this.userData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Color customColor = const Color(0xFF666666);
  final Color appColor = const Color(0xFF64C9AC);
  bool _obscureText = true;

  void _showValidationDialog(bool isValid) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Validation Result'),
          content: Text(isValid ? 'Valid Fields' : 'Invalid Fields'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showApiResultDialog(String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('API Response'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onSaveChangesPressed() async {
    final fullName = _fullNameController.text;
    final password = _passwordController.text;
    final phoneNo = _phoneController.text;

    // Perform validation here
    final isValid =
        fullName.isNotEmpty && password.isNotEmpty && phoneNo.isNotEmpty;

    if (isValid) {
      // Prepare the request body
      final Map<String, dynamic> requestBody = {
        "fullName": fullName,
        "password": password,
        "phoneNo": phoneNo,
      };

      // Send a PUT request to update the user
      final response = await http.put(
        Uri.parse(
            'http://localhost:4110/api/users/${widget.userData["email"]}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Check the response and show it in a dialog
      if (response.statusCode == 200) {
        _showApiResultDialog('User information updated successfully');

        // Parse the response body as JSON
        final updatedUserData = jsonDecode(response.body);
        // print(updatedUserData);
        // Navigate to AccountScreen with data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountScreen(data: updatedUserData['user']),
          ),
        );
      } else {
        _showApiResultDialog('Failed to update user: ${response.body}');
      }
    } else {
      _showValidationDialog(isValid);
    }
  }

  @override
  void initState() {
    super.initState();
    // Convert the values to strings
    _fullNameController.text = widget.userData["fullName"].toString();
    _passwordController.text = widget.userData["password"].toString();
    _phoneController.text = widget.userData["phoneNo"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: appColor,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Edit Profile!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color: customColor,
                  ),
                  prefixIcon: const Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customColor),
                  ),
                  prefixIconColor: customColor,
                  suffixIconColor: customColor,
                ),
                controller: _fullNameController,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: customColor,
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customColor),
                  ),
                  prefixIconColor: customColor,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: customColor,
                    ),
                  ),
                ),
                obscureText: _obscureText,
                controller: _passwordController,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone No',
                  labelStyle: TextStyle(
                    color: customColor,
                  ),
                  prefixIcon: const Icon(Icons.phone),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customColor),
                  ),
                  prefixIconColor: customColor,
                  suffixIconColor: customColor,
                ),
                controller: _phoneController,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _onSaveChangesPressed,
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 40),
                        backgroundColor: customColor,
                        shadowColor: customColor,
                      ),
                      child: const Text(
                        'SAVE CHANGES',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 40),
                        backgroundColor: appColor,
                        shadowColor: appColor,
                      ),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
