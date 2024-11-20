import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  void _logout(BuildContext context) {
    // Navigate back to the LoginScreen and remove all previous screens from the stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _logout(context),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Log Out',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
