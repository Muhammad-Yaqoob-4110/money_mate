import 'package:flutter/material.dart';
import 'package:money_mate/pages/sign_up.dart';
import 'package:money_mate/pages/login_in.dart';

class MoneyMateLandingPage extends StatelessWidget {
  const MoneyMateLandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    double buttonMargin = 8.0;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140.0),
                  border: Border.all(
                    color: Colors.blue,
                    width: 5.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(140.0),
                  child: Image.asset(
                    '../assets/money_mate.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: buttonMargin,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Sign up
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: buttonMargin),
                    fixedSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: buttonMargin,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: buttonMargin),
                    fixedSize: const Size(double.infinity, 40),
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.green,
                  ),
                  child: const Text('Log in'),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
