import 'package:flutter/material.dart';
import 'package:money_mate/pages/login_signup_screen.dart';

// ... (Your existing imports and widgets)

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
            // Full Name Text Field
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
              controller: _fullNameController, // Bind the controller
            ),
            const SizedBox(height: 16.0),

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
            const SizedBox(height: 16.0),

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
            const SizedBox(height: 16.0),

            // Phone Text Field
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
              controller: _phoneController, // Bind the controller
            ),

            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Create a dialog box with entered data
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('User Information'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Full Name: ${_fullNameController.text}'),
                                Text('Email: ${_emailController.text}'),
                                Text('Password: ${_passwordController.text}'),
                                Text('Phone No: ${_phoneController.text}'),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
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
