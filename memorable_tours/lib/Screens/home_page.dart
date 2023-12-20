import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart' as location_package;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedButtonIndex = -1;
  late location_package.Location _location; // Rename the variable

  String _currentLocation = ''; // To store the current city and country

  @override
  void initState() {
    super.initState();
    _location = location_package.Location(); // Rename the variable
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      location_package.LocationData currentLocation =
          await _location.getLocation();
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
        currentLocation.latitude!,
        currentLocation.longitude!,
        localeIdentifier: 'en_US', // Set your preferred locale
      );

      if (placemarks.isNotEmpty) {
        geocoding.Placemark placemark = placemarks[0];
        setState(() {
          _currentLocation = '${placemark.locality}, ${placemark.country}';
        });
      }
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.only(top: 60.0, left: 16.0, right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Icon(Icons.location_on, color: Colors.black),
                  ),
                ),
                SizedBox(width: 12.0),
                // Text which shows current location of user
                Text(
                  _currentLocation.isNotEmpty
                      ? _currentLocation
                      : 'Fetching location...',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Epilogue',
                    //fontWeight: FontWeight.w500
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Hello, Abdur',
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Epilogue-Bold',
                //fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Where would you like to go?',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontFamily: 'Epilogue'),
            ),
          ],
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.only(top: 60.0, left: 16.0, right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Icon(Icons.location_on, color: Colors.black),
                  ),
                ),
                SizedBox(width: 12.0),
                //Text which shows current location of user
                Text(
                  _currentLocation.isNotEmpty
                      ? _currentLocation
                      : 'Fetching location...',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Epilogue',
                    //fontWeight: FontWeight.w500
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Hello, Abdur',
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Epilogue-Bold',
                //fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Where would you like to go?',
              style: TextStyle(
                  fontSize: 16.0, color: Colors.black, fontFamily: 'Epilogue'),
            ),
            SizedBox(height: 16.0),
            buildButtonList(),
            SizedBox(height: 16.0),
            buildImageList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // Set the color of selected icons
        unselectedItemColor:
            Colors.black.withOpacity(1), // Set the color of unselected icons
        currentIndex:
            0, // Set the default selected index (0 for Home in this case)
        showSelectedLabels: true, // Show labels for the selected icon
        showUnselectedLabels: false, // Hide labels for unselected icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, size: 30),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              size: 30,
            ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, size: 30),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle tap events here
          // You can use setState to update the selected index if needed
          // For example: setState(() { currentIndex = index; });
        },
      ),
    );
  }

  Widget buildButtonList() {
    // List of button texts
    List<String> buttonTexts = [
      'Mountain',
      'Forest',
      'Museum',
      'Forest',
      'Mountain',
      'Forest'
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(buttonTexts.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedButtonIndex = index;
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(110, 40),
                primary:
                    _selectedButtonIndex == index ? Colors.black : Colors.white,
                onPrimary:
                    _selectedButtonIndex == index ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),
              child: Text(
                buttonTexts[index],
                style: TextStyle(
                  fontFamily: 'Epilogue',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildImageList() {
    // List of image paths and corresponding texts
    List<Map<String, String>> imagesWithText = [
      {'path': 'assets/images/onboard_3.jpg', 'text': 'Storronden'},
      {'path': 'assets/images/onboard_2.jpg', 'text': 'Location'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(imagesWithText.length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 16.0),
            width: 300.0,
            height: 500.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.black, // Border color
                width: 0, // Border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.0), // Shadow color
                  spreadRadius: 2.0, // Spread radius
                  blurRadius: 5.0, // Blur radius
                  offset: Offset(0, 2), // Offset (vertical, horizontal)
                ),
              ],
            ),
            child: Stack(
              children: [
                // Image
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      imagesWithText[index]['path']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text on the top left
                Positioned(
                  top: 15.0,
                  left: 10.0,
                  child: Text(
                    imagesWithText[index]['text']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Epilogue-Bold',
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
