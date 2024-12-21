import 'package:flutter/material.dart';
import 'package:gofoodgreen/gofoodgreen/gfg_screen/chats.dart';
import 'package:gofoodgreen/gofoodgreen/gfg_screen/orders.dart';
import 'package:gofoodgreen/gofoodgreen/gfg_screen/restaurant.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  // List of screens corresponding to the bottom nav bar items
  List<Widget> _pages = [
    HomeScreen(), // The default Home screen
    RestaurantScreen(), // Restaurant screen
    OrdersScreen(), // Orders screen
    ChatScreen(), // Chat screen
  ];

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    List<String> menuBottomNav = ['Home', 'Restaurant', 'Orders', 'Chat'];

    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 1) {
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              '${menuBottomNav.elementAt(index)} was clicked',
              style: TextStyle(color: Color.fromARGB(255, 61, 135, 42)),
            ),
            action: SnackBarAction(
              backgroundColor: Color.fromARGB(255, 61, 135, 42),
              textColor: Colors.white,
              label: 'Close',
              onPressed: scaffold.hideCurrentSnackBar,
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
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
        onTap: _onTappedBottomNav, // Call the function to handle tap
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
