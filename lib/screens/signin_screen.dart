import 'package:flutter/material.dart';
import './signup_screen.dart';
import './homepage_screen.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 221, 221), // Set background color
      body: SafeArea( // Wrap the body with SafeArea
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
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
                          SizedBox(width: 7),
                          Checkbox(
                            value: _isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                _isChecked = newValue ?? false;
                              });
                            },
                            fillColor: MaterialStateColor.resolveWith(
                                    (states) => _isChecked ? Colors.green : Colors.transparent),
                          ),
                          Text(
                            'Keep me signed in',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}