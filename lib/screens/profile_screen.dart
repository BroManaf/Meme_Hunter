import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center( // Center the entire column
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center vertically within the available space
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60, // Adjust the size of the profile picture
              backgroundImage: NetworkImage(
                'https://example.com/path_to_profile_picture.jpg', // Replace with the URL or asset path of the profile picture
              ),
            ),
            SizedBox(height: 16), // Space between picture and name

            // Name
            Text(
              'Irfan Maulana Manaf',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text within the Text widget
            ),
            SizedBox(height: 8), // Space between name and ID

            // ID
            Text(
              '21120122140097',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center, // Center the text within the Text widget
            ),
            SizedBox(height: 16), // Space between ID and description

            // Additional Description
            Text(
              'Tugas Akhir praktikum PPB membuat aplikasi Template Meme',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center the text within the Text widget
            ),
          ],
        ),
      ),
    );
  }
}
