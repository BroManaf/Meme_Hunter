import 'package:flutter/material.dart';
import '../models/meme.dart';

class MemeDetailScreen extends StatelessWidget {
  final Meme meme;

  MemeDetailScreen({required this.meme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meme.name)),
      body: Column(
        children: [
          Image.network(meme.url),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(meme.name),
          ),
        ],
      ),
    );
  }
}
