import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memorable_tours/Screens/home_page.dart';

class EmailVerificationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Email Icon
            Icon(
              Icons.email,
              size: 125.0,
              color: Colors.black, // You can customize the color
            ),
            SizedBox(height: 70.0),

            // Title
            Text(
              'Verify your email address',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Epilogue',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),

            // Subtitle
            Text(
              'A verification link has been sent to your email. Please check your inbox and click on the link to complete the verification process.',
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Epilogue'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.0),

            // Continue Button
            ElevatedButton(
              onPressed: () async {
                // Check if email verification is completed
                User? currentUser = _auth.currentUser;
                await currentUser?.reload();
                currentUser = _auth.currentUser;

                if (currentUser?.emailVerified == true) {
                  // Email verification completed, navigate to home screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  // Email verification not completed, show a message or take appropriate action
                  print('Email verification is not completed yet.');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: Colors.black, // Border color
                    width: 1.0, // Adjust the width of the border
                  ),
                ),
                minimumSize: Size(100, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15.0), // Add some space between text and icon
                  Icon(
                    Icons.arrow_forward, // Replace with your desired icon
                    size: 24.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
