import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorable_tours/Screens/email_verification.dart';
import 'package:memorable_tours/Screens/home_page.dart';

import '../Firebase Auth/firebase_auth.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 25, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Signup',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Image.asset(
              'assets/images/travel_illustration.jpg',
              height: 220.0,
            ),
            SizedBox(height: 0.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 0.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 0.0),
            ElevatedButton(
              onPressed: () {
                signUp(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
                minimumSize: Size(350.0, 50.0),
                elevation: 0.5,
              ),
              child: Text(
                'Signup',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Epilogue',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'OR',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Epilogue'),
            ),
            SizedBox(height: 0.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add your Google login logic here
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: 25.0,
                width: 25.0,
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF2F2F2),
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
                elevation: 0.5,
              ),
              label: Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Epilogue',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show an error message if any field is empty
      print('Email and password are required.');
      return;
    }

    if (password.length < 8) {
      // Show an error message if the password is too short
      print('Password must be at least 8 characters.');
      return;
    }

    // Call the signup function from your authentication service
    AuthService authService = AuthService();
    User? user = await authService.signupWithEmailAndPassword(email, password);

    if (user != null) {
      // If signup is successful, navigate to the HomeScreen
      onSignUpComplete(context);
    } else {
      // If signup fails, you can show an error message or handle it accordingly
    }
  }

  void onSignUpComplete(BuildContext context) async {
    // Navigate to the EmailVerification screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
    );
    // Call the email verification function
    await sendVerificationEmail();
  }

  Future<void> sendVerificationEmail() async {
    AuthService authService = AuthService();
    User? currentUser = await authService.getCurrentUser();

    if (currentUser != null) {
      await authService.sendVerificationEmail(currentUser);
    }
  }
}
