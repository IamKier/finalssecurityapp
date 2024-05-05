import 'package:finalssecurityapp/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:finalssecurityapp/screens/addsmartdevice.dart';
import 'package:finalssecurityapp/util/smart_device_box.dart';
import 'package:finalssecurityapp/util/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  int _selectedIndex = 0; // Initialize selected index for the navigation bar

  List<List<dynamic>> mySmartDevices = [
    ["Smart Lock", "assets/icons/lock.png", true],
    ["Smart Camera", "assets/icons/camera.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  void _onItemTapped(int index) {
  if (index == 1) {
    // Navigate to AddSmartDeviceScreen and wait for result
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddSmartDeviceScreen()),
    ).then((newDevice) {
      if (newDevice != null) {
        setState(() {
          // Add the new device to the list
          mySmartDevices.add([
            newDevice.name,
            newDevice.type == 'Camera' ? 'assets/icons/camera.png' : 'assets/icons/lock.png',
            false,
          ]);

          // Print the updated list to the console
          print('Updated smartDevices list: $mySmartDevices');
        });
      }
    });
  } else {
    setState(() {
      _selectedIndex = index;
    });
  }
}



  @override
  Widget build(BuildContext context) {
    return NavBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 36, 35, 35)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Smart Devices",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => _onItemTapped(1), // Open AddSmartDeviceScreen when FloatingActionButton is pressed
                      backgroundColor: const Color.fromARGB(255, 125, 129, 133),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
