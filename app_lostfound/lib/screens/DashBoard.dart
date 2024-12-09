import 'package:app_lostfound/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Dashboard'),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => SignInScreen())),
                    (route) => false);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
