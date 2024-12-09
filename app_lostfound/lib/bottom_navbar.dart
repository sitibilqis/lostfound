import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showUnselectedLabels: true,
      iconSize: 32,
      selectedItemColor: Color.fromRGBO(58, 87, 232, 1),
      selectedFontSize: 18,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? Color.fromRGBO(58, 87, 232, 1) : Colors.grey,
              BlendMode.srcIn,
            ),
            child: Image.network(
              'https://cdn-icons-png.freepik.com/512/64/64182.png?ga=GA1.1.1217259142.1697699537',
              color: Colors.grey,
              height: 30,
              width: 30,
            ),
          ),
            label: 'Lost'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: currentIndex == 1
                ? Color.fromRGBO(58, 87, 232, 1)
                : Colors.transparent,
            child: Icon(
              Icons.home,
              color: currentIndex == 1 ? Colors.white : Colors.grey,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? Color.fromRGBO(58, 87, 232, 1) : Colors.grey,
              BlendMode.srcIn,
            ),
            child: Image.network(
              'https://cdn-icons-png.freepik.com/512/251/251065.png?ga=GA1.1.1217259142.1697699537',
              height: 30,
              width: 30,
            ),
          ),
            label: 'Found'),
      ],
    );
  }
}