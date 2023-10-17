import 'package:flutter/material.dart';
import 'package:money_mate/pages/Login%20Signup%20Screens/login_in.dart';
import 'package:money_mate/pages/Login%20Signup%20Screens/sign_up.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF64C9AC), // Background color for the container
          height: 200.0, // Set the height for the container
          width: double.infinity, // Set the width to fill the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Image.asset(
                  '../assets/logo.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),

              const SizedBox(
                  height: 10.0), // Add space between the image and text
              const Text(
                'MoneyMate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white, // Background color for the second container
            width: double.infinity, // Set the width to fill the screen
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF666666),
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 350.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Sign up
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64C9AC),
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('SIGNUP'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
