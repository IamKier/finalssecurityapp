import 'package:flutter/material.dart';
import './signin_screen.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Set teal background color
      body: SingleChildScrollView (
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
        children: [
          const Text(
            'Create an Account',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20), // Add space after the Create an Account text
          Padding(
            padding: const EdgeInsets.all(30.0), // Add padding
            child: Container(
              width: double.infinity, // Set the width to match the screen width
              padding: const EdgeInsets.all(20.0), // Add padding inside the container
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Set the opacity to 70%
                borderRadius: BorderRadius.circular(20), // Add rounded corners
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10), // Add some spacing
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 7), // Add space to move the checkbox and text to the left
                      Checkbox(
                        value: _isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        fillColor: WidgetStateColor.resolveWith(
                                (states) => _isChecked ? Colors.green : Colors.transparent),
                      ),
                      const Text(
                        'Agree to terms and conditions',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add space under the "Agree to terms and conditions" text
                  SizedBox(
                    width: 250,
                    height: 40, // Reduce the height of the container
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform registration action here
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Add space between the container and the "Back to Login" button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('Back to Login'),
          ),
        ],
      ),
      )
    );
  }
}