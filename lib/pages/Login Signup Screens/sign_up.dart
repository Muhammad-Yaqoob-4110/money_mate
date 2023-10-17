import 'package:flutter/material.dart';
import 'package:money_mate/pages/Login%20Signup%20Screens/login_signup_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Color customColor = const Color(0xFF666666);
  final Color appColor = const Color(0xFF64C9AC);
  bool _obscureText = true;

  Future<void> _signup() async {
    final String apiUrl = "http://localhost:4110/api/users";

    final data = {
      "fullName": _fullNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "phoneNo": _phoneController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: json.encode(data), // Encode the data as JSON
    );
    print(response.statusCode); // Check the status code
    print(response.body); // Check the response body

    final responseData = json.decode(response.body);
    final message = responseData["message"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('API Response'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGNUP'),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                fillColor: customColor,
                hoverColor: customColor,
              ),
              controller: _fullNameController,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: customColor,
                ),
                prefixIcon: const Icon(Icons.email),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: customColor),
                ),
                prefixIconColor: customColor,
                suffixIconColor: customColor,
                fillColor: customColor,
                hoverColor: customColor,
              ),
              controller: _emailController,
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
                fillColor: customColor,
                hoverColor: customColor,
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
                fillColor: customColor,
                hoverColor: customColor,
              ),
              controller: _phoneController,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _signup(); // Perform signup and show API response
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 40),
                      backgroundColor: customColor,
                      shadowColor: customColor,
                    ),
                    child: const Text(
                      'SIGNUP',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginSignupScreen()),
                      );
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
    );
  }
}
