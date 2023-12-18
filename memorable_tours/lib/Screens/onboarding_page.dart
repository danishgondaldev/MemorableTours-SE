import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardingPage(
            image: 'assets/images/onboard_2.jpg',
            upperLeftText: 'Plan And Customize.',
            upperLeftSubText:
                'Choose your destination.Pick the\nbest place for you holiday',
            centerRightText: 'Explore Unique Places.',
            centerRightSubText:
                'Explore a world of possibilities.\nDiscover hidden gems',
            bottomLeftText: 'Plan Your Trip.',
            bottomLeftSubText:
                'Create personalized tips, add\nstops, and design your adventure.',
            onGetStartedPressed: () => _completeOnboarding(context),
          ),
        ],
      ),
    );
  }

  void _completeOnboarding(BuildContext context) async {
    // Save that onboarding is completed
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    // Navigate to the main screen or any other screen you want to show after onboarding
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String upperLeftText;
  final String upperLeftSubText;
  final String centerRightText;
  final String centerRightSubText;
  final String bottomLeftText;
  final String bottomLeftSubText;
  final VoidCallback? onGetStartedPressed;

  OnboardingPage({
    required this.image,
    required this.upperLeftText,
    required this.upperLeftSubText,
    required this.centerRightText,
    required this.centerRightSubText,
    required this.bottomLeftText,
    required this.bottomLeftSubText,
    this.onGetStartedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Upper Left Text
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 75.0, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    upperLeftText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Epilogue',
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(1.5, 1.5),
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    upperLeftSubText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Center Right Text
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 25, top: 230),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // Align text to the end (right)
                children: [
                  Text(
                    centerRightText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Epilogue',
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    centerRightSubText,
                    textAlign:
                        TextAlign.right, // Align the second line to the right
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Left Text
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bottomLeftText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Epilogue',
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    bottomLeftSubText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Epilogue',
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Get Started Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0, left: 50, right: 50),
              child: ElevatedButton(
                onPressed: onGetStartedPressed,
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime, // Change the button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Adjust the button radius
                    side: BorderSide(
                        color: Colors.black,
                        width: 2.0), // Add a border to the button
                  ),
                  minimumSize: Size(200.0, 50.0), // Adjust the button size
                  elevation: 5.0, // Add elevation (shadow) to the button
                  shadowColor: Colors.white10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started',
                        style: TextStyle(fontSize: 18.0, color: Colors.black)),
                    SizedBox(
                        width: 8.0), // Add some space between text and icon
                    Icon(Icons.arrow_forward,
                        color: Colors.black), // Add an arrow icon
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
