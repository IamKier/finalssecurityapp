import 'package:flutter/material.dart';
import 'homepage_screen.dart';
import '../util/navbar.dart';

class MenuScreen extends StatelessWidget {
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
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Add Photo'),
                      onTap: () {
                        // Handle action when "Add Photo" is tapped
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text('Add Music'),
                      onTap: () {
                        // Handle action when "Add Music" is tapped
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.video_call),
                      title: Text('Add Video'),
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
        appBar: AppBar(
          title: Text('Menu'),
          automaticallyImplyLeading: false, // Remove back button
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to Home page
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Go to Home'),
              ),
              ElevatedButton(
                onPressed: () {
                  // You can implement other menu options here
                },
                child: Text('Other Option'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
