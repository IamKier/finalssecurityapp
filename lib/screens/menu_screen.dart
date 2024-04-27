import 'package:flutter/material.dart';
import '../util/navbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBar(
      currentIndex: 1, // Set the current index to the index of Menu
      onTap: (index) {
        if (index == 0) {
          // Navigate to Home page
          Navigator.popUntil(context, ModalRoute.withName('/'));
        } else if (index == 2) {
          // Show bottom sheet menu
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Add Photo'),
                      onTap: () {
                        // Handle action when "Add Photo" is tapped
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.music_note),
                      title: const Text('Add Music'),
                      onTap: () {
                        // Handle action when "Add Music" is tapped
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.video_call),
                      title: const Text('Add Video'),
                      onTap: () {
                        // Handle action when "Add Video" is tapped
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 129, 133), // Set background color
        appBar: AppBar(
          backgroundColor: Colors.white, // Set appbar background color to white
          automaticallyImplyLeading: false, // Remove back button
          title: const Text('SecurityApp'), // App title
          actions: [
            // Settings Icon
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Add your settings functionality here
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView( // Wrap Column with SingleChildScrollView
            child: Column(
              children: [
                // User Profile Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white, // Set white background color
                  child: Row(
                    children: [
                      // Profile Icon
                      CircleAvatar(
                        // Add your user profile image here
                        radius: 30, // Increase the radius to make it larger
                        // backgroundImage: AssetImage('path_to_your_image'),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Add your preferred background color
                        foregroundColor: Colors.black, // Set icon color to black
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20, // Increase the font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set text color to black
                            ),
                          ),
                          SizedBox(height: 5),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 201, 199, 199), // Grey background color
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 16, // Font size
                                  color: const Color.fromARGB(255, 70, 201, 146), // Green text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Top Part
                Container(
                  height: 200, // Example height
                  color: Colors.grey, // Example color
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to Home page
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: const Text('Go to Home'),
                    ),
                  ),
                ),
                // Mid Part
                Container(
                  height: 300, // Example height
                  color: Colors.grey, // Example color
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // You can implement other menu options here
                      },
                      child: const Text('Other Option'),
                    ),
                  ),
                ),
                // Bottom Part
                Container(
                  height: 200, // Example height
                  color: Colors.grey, // Example color
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // You can implement other menu options here
                      },
                      child: const Text('Bottom Option'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
