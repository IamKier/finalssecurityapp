import 'package:flutter/material.dart';
import 'package:finalssecurityapp/util/smart_device_box.dart';
import 'package:finalssecurityapp/util/navbar.dart';
import 'package:finalssecurityapp/screens/addsmartdevice.dart';

class MenuScreen extends StatelessWidget {
  final List<SmartDevice>? smartDevices; // Update to nullable list of SmartDevice

  const MenuScreen({Key? key, required this.smartDevices});

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
        backgroundColor: Colors.grey[200], // Set background color to light grey
        appBar: AppBar(
          backgroundColor: Colors.white, // Set appbar background color to white
          automaticallyImplyLeading: false, // Remove back button
          title: const Text('SecurityApp'), // App title
          // Remove settings icon from the app bar
          actions: const [],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        foregroundColor: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 201, 199, 199),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 70, 201, 146),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // List of Smart Devices
                if (smartDevices != null && smartDevices!.isNotEmpty) // Check if the list is not null and not empty
                  Column(
                    children: smartDevices!.map((device) {
                      return SmartDeviceBox(
                        smartDeviceName: device.name,
                        iconPath: device.type == 'Camera' ? 'assets/icons/camera.png' : 'assets/icons/lock.png',
                        powerOn: false, // Assuming the power status is always off initially
                        onChanged: (value) {
                          // Handle power switch changes
                        },
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
