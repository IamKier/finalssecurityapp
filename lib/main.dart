import 'package:flutter/material.dart';
import './screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Security App', // Set the app name
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(), // Start with MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginPage after 10 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set black background
      appBar: null, // Remove the app title bar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator( // Loading circle
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Set loading circle color to white
            ),
            const SizedBox(height: 20), // Spacer
            const Text(
              'Loading...',
              style: TextStyle(fontSize: 20, color: Colors.white), // Set text color to white
            ),
          ],
        ),
      ),
    );
  }
}