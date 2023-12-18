import 'package:flutter/material.dart';

class LocationDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 55, left: 16, right: 16, bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Geirangerfjord',
                      style: TextStyle(
                          fontSize: 30.0, fontFamily: 'Epilogue-Bold'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sunnmore, Norway',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Epilogue',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              width: 370.0,
              height: 585.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/onboard_3.jpg'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Text on the top left
                  Positioned(
                    bottom: 25,
                    left: 10.0,
                    child: Text(
                      'Nestled in the southern Aegean Sea,\nSantorini is a breathtaking Greek island\nrenowned'
                          ' for its enchanting landscapes\nand vibrant culture. With its iconic white-\nwashed '
                          'buildings perched atop cliffs', // Replace with your desired text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Epilogue',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 75, // Adjust the width of the first button
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the first button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .white, // Replace with your desired background color
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black, // Border color
                          width: 1.0, // Adjust the width of the border
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.bookmark_border, // Replace with your desired icon
                      size: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Adjust the spacing between the buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lime,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black, // Border color
                          width: 1.0, // Adjust the width of the border
                        ),
                      ),
                      minimumSize: Size(200, 75),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start journey',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
