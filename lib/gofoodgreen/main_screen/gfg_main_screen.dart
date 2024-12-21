import 'package:flutter/material.dart';
import 'package:gofoodgreen/gofoodgreen/gfg_screen/menu_gfg_screen.dart';

import '../gfg_screen/chats.dart';
import '../gfg_screen/orders.dart';
import '../gfg_screen/restaurant.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MenuGfgScreen(), // Existing content of MainScreen
    RestaurantScreen(),
    OrdersScreen(),
    ChatScreen(),
  ];

  void _onTappedBottomNav(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 61, 135, 42),
        onTap: _onTappedBottomNav,
      ),
    );
  }
}
