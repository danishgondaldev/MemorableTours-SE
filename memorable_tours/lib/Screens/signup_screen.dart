import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 25,left: 25,right: 25),
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
              'assets/images/travel_illustration.jpg', // Replace with your image URL
              height: 220.0,
            ),
            SizedBox(height: 0.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),*/
              ),
            ),
            SizedBox(height: 0.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),*/
              ),
            ),
            SizedBox(height: 0.0),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(8.0), // Adjust border radius
                  side: BorderSide(color: Colors.black), // Adjust border color
                ),
                minimumSize: Size(350.0, 50.0),
                elevation: 0.5, // Adjust shadow
              ),
              child: Text(
                'Signup',
                style: TextStyle(
                    fontSize: 20.0, // Adjust font size
                    fontFamily: 'Epilogue', // Adjust font family
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
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
                'assets/images/google.png', // Replace with the correct path
                height: 25.0,
                width: 25.0,
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF2F2F2),
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(8.0), // Adjust border radius
                  side: BorderSide(color: Colors.black), // Adjust border color
                ),
                //minimumSize: Size(350.0, 50.0),
                elevation: 0.5, // Adjust shadow
              ),
              label: Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 14.0, // Adjust font size
                  fontFamily: 'Epilogue', // Adjust font family
                  color: Colors.black, // Adjust text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
