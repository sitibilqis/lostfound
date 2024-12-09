import 'package:app_lostfound/addlost.dart';
import 'package:app_lostfound/bottom_navbar.dart';
import 'package:app_lostfound/found/additems.dart';
import 'package:app_lostfound/foundpage.dart';
// import 'package:app_lostfound/foundpage.dart';
import 'package:app_lostfound/lostpage.dart';
import 'package:app_lostfound/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Set initial index to 1 (Home)

  Widget buildCard(dynamic icon, String title, String subtitle) {
    Widget iconWidget;

    if (icon is String) {
      iconWidget = Image.network(icon, width: 80, height: 80);
    } else if (icon is IconData) {
      iconWidget = Icon(icon, size: 80);
    } else {
      iconWidget =
          Container(); // Default to an empty container if icon type is unknown
    }

    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      width: 150,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            iconWidget,
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> cardData = [
    {
      'icon':
          'https://cdn-icons-png.freepik.com/512/16551/16551266.png?ga=GA1.1.1217259142.1697699537',
      'title': 'Report Lost Items',
      'subtitle': 'Report if you lost an item.',
      'navigateToAddLost': true,
      'navigateToAddFound': false,
    },
    {
      'icon':
          'https://cdn-icons-png.freepik.com/512/11962/11962471.png?ga=GA1.1.1217259142.1697699537',
      'title': 'Report Found Items',
      'subtitle': 'Report if you found an item.',
      'navigateToAddLost': false,
      'navigateToAddFound': true,
    },
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LostPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoundPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Navbar
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
              color: Color.fromRGBO(58, 87, 232, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person,
                          size: 30, color: Colors.white),
                      onPressed: () => {},
                    ),
                  ],
                ),
                IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignInScreen())),
                              (route) => false);
                        },
                        icon: Icon(Icons.logout)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Pagi",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "Halo, Marcel!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Cards for form options, lost, found
          for (var data in cardData)
            GestureDetector(
              onTap: () {
                if (data['navigateToAddLost']) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddLost()),
                  );
                } else if (data['navigateToAddFound']) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItems()),
                  );
                }
              },
              child: buildCard(data['icon'], data['title'], data['subtitle']),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
