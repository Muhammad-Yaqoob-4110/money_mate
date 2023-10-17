import 'package:flutter/material.dart';
import 'package:money_mate/pages/Login%20Signup%20Screens/login_signup_screen.dart';

class MoneyMateSplashScreen extends StatelessWidget {
  const MoneyMateSplashScreen({Key? key}) : super(key: key);

  void navigateToNextPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const LoginSignupScreen(), // Replace 'NextPage()' with your desired next page widget.
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToNextPage(
        context); // Call the function to navigate after 5 seconds

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/logo.png',
              width: 200.0,
              height: 200.0,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'MoneyMate',
                style: TextStyle(
                  color: Color(0xFF64C9AC),
                  fontSize: 25.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Split bills the easy way',
                style: TextStyle(
                  color: Color(0xFF64C9AC),
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
