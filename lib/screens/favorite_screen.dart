import 'package:flutter/material.dart';
import '../models/meme.dart';
import 'meme_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meme> favoriteMemes;
  final Function(Meme) onRemoveFavorite;

  FavoriteScreen({
    required this.favoriteMemes,
    required this.onRemoveFavorite,
  });

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _removeMeme(Meme meme) {
    setState(() {
      widget.onRemoveFavorite(meme); // Call the parent function to remove the meme
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Memes'),
      ),
      body: widget.favoriteMemes.isEmpty
          ? Center(
              child: Text('No favorites added.'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: widget.favoriteMemes.length,
                itemBuilder: (context, index) {
                  final meme = widget.favoriteMemes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MemeDetailScreen(meme: meme),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.0)),
                              child: Image.network(
                                meme.url,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meme.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _removeMeme(meme), // Remove meme immediately
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
