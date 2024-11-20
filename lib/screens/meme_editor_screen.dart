import 'package:flutter/material.dart';
import '../models/meme.dart';

class MemeEditorScreen extends StatefulWidget {
  final Meme meme;

  MemeEditorScreen({required this.meme});

  @override
  _MemeEditorScreenState createState() => _MemeEditorScreenState();
}

class _MemeEditorScreenState extends State<MemeEditorScreen> {
  final TextEditingController _topTextController = TextEditingController();
  final TextEditingController _bottomTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Meme'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.network(widget.meme.url, fit: BoxFit.contain),
                ),
                // Top Text Overlay
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Text(
                    _topTextController.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom Text Overlay
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Text(
                    _bottomTextController.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _topTextController,
                  decoration: InputDecoration(labelText: 'Top Text'),
                  onChanged: (text) {
                    setState(() {}); // Rebuild to update text overlay
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _bottomTextController,
                  decoration: InputDecoration(labelText: 'Bottom Text'),
                  onChanged: (text) {
                    setState(() {}); // Rebuild to update text overlay
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back after editing
                  },
                  child: Text('Save Meme'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
