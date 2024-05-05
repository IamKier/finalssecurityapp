import 'package:flutter/material.dart';
import 'homepage_screen.dart'; // Import your HomePage file
import '../util/navbar.dart'; // Import the NavBar widget

// Define the SmartDevice class
class SmartDevice {
  final String name;
  final String type;

  SmartDevice({
    required this.name,
    required this.type,
  });
}

class AddSmartDeviceScreen extends StatefulWidget {
  const AddSmartDeviceScreen({Key? key}) : super(key: key);

  @override
  _AddSmartDeviceScreenState createState() => _AddSmartDeviceScreenState();
}

class _AddSmartDeviceScreenState extends State<AddSmartDeviceScreen> {
  late String _selectedDeviceType;
  late TextEditingController _deviceNameController;
  bool _showWarning = false;

  @override
  void initState() {
    super.initState();
    _selectedDeviceType = 'Camera'; // Set default device type to Camera
    _deviceNameController = TextEditingController();
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside of text field
      },
      child: NavBar(
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
          backgroundColor: Colors.grey[200], // Set background color to light grey
          appBar: AppBar(
            automaticallyImplyLeading: false, // Removes the back button
            title: const Text('Add Devices'), // Set the title to "Add Devices"
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Dropdown for selecting device type
                      DropdownButton<String>(
                        value: _selectedDeviceType,
                        onChanged: (value) {
                          setState(() {
                            _selectedDeviceType = value!;
                          });
                        },
                        items: ['Camera', 'Smart Lock']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      // Text field for entering device name
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _deviceNameController,
                          decoration: InputDecoration(
                            labelText: 'Device Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Get the entered device name
                          String deviceName = _deviceNameController.text;

                          // Check if the device name is empty
                          if (deviceName.isNotEmpty) {
                            // Create a new SmartDevice object
                            SmartDevice newDevice = SmartDevice(
                              name: deviceName,
                              type: _selectedDeviceType,
                            );

                            // Navigate back to the previous screen and pass the new device as a result
                            Navigator.pop(context, newDevice);
                          } else {
                            // Show the warning message
                            setState(() {
                              _showWarning = true;
                            });
                          }
                        },
                        child: const Text('Save Device'),
                      ),
                    ],
                  ),
                ),
                if (_showWarning)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Text(
                          'Please enter a device name.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
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
