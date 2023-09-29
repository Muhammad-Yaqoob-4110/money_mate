import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  10.0), // Adjust the border radius as needed
              child: Image.asset(
                '../assets/money_mate.jpg', // Correct asset path
                height: 30, // Adjust the height of the image
              ),
            ),
            SizedBox(width: 8), // Add some spacing between image and title
            Text('Money Mate'),
          ],
        ),
      ),
      // Add the rest of your page content here
    );
  }
}
