import 'package:flutter/material.dart';
import './signup_screen.dart';
import './homepage_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 221, 221), // Set background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0), // Add top padding here
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color to black
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
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
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 7),
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
                              'Keep me signed in',
                              style: TextStyle(color: Colors.black), // Set text color to black
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            child: const Text('Login', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))), // Set text color to black
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text('Create an account', style: TextStyle(color: Colors.black)), // Set text color to black
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
