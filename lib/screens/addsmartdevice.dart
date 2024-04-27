import 'package:flutter/material.dart';
import 'homepage_screen.dart'; // Import your HomePage file
import '../util/navbar.dart'; // Import the NavBar widget

class AddSmartDeviceScreen extends StatelessWidget {
  const AddSmartDeviceScreen({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return NavBar( // Wrap the entire Scaffold with the NavBar widget
    currentIndex: 1, // Assuming this screen corresponds to the "Add" tab
    onTap: (index) {
      if (index == 0) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      } else if (index == 2) {
        // Navigate to the "List" screen if needed
      }
    },
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: Text('Add Devices'), // Set the title to "Add Devices"
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Here you can add new smart devices.'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
}