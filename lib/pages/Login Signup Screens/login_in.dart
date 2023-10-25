import 'package:flutter/material.dart';
import 'package:money_mate/pages/Login%20Signup%20Screens/sign_up.dart';
import 'package:money_mate/pages/Dashboard/dash_board.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final Color customColor = const Color(0xFF666666);
  final Color appColor = const Color(0xFF64C9AC);

  void _showDialog(String message, dynamic data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('API Response'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(message),
              if (message == "Authentication successful") Text("Data: $data"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if (message == "Authentication successful") {
                  // Navigate to DashBoard with data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DashBoard(data: data), // Pass data to DashBoard
                    ),
                  );
                }
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    final String apiUrl = "http://localhost:4110/api/users/login";

    final Map<String, String> body = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final data = responseData["data"];
      final message = responseData["message"];
      _showDialog(message, data);
    } else {
      _showDialog("Login failed. Check your credentials.", null);
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonMargin = 8.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Email Text Field
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
              controller: _emailController, // Bind the controller
            ),
            const SizedBox(height: 16),
            // Password Text Field
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
              controller: _passwordController, // Bind the controller
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(); // Make the login request
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: buttonMargin),
                fixedSize: const Size(double.infinity, 40),
                backgroundColor: customColor,
                shadowColor: customColor,
              ),
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(
                  color: customColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
