import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/homepage_screen.dart';
import '../screens/menu_screen.dart'; // Import the MenuScreen file

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Widget child; // Define child widget

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child, // Show the content of the screen
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Add padding for space around the BottomNavigationBar
            child: ClipRRect(  // Clip it with rounded corners
              borderRadius: BorderRadius.circular(20), // Circular borders
              child: BackdropFilter(  // Optional: Apply a filter for a frosted glass effect
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Material(
                  elevation: 4, // Add elevation for shadow effect
                  borderRadius: BorderRadius.circular(20), // Adjust corner radius as needed
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.grid_3x3_rounded),
                        label: 'Menu',
                      ),
                    ],
                    currentIndex: currentIndex,
                    selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                    onTap: (index) {
                      if (index == 0) {
                        // Navigate to the HomePage when the "Home" tab is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      } else if (index == 1) {
                        // Navigate to the MenuScreen when the "Menu" tab is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuScreen()),
                        );
                      } else {
                        // Handle navigation to other screens
                        onTap(index);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
