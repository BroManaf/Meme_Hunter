import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/meme.dart';
import 'meme_editor_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Meme) onFavoriteToggle;
  final List<Meme> favoriteMemes;

  HomeScreen({
    required this.onFavoriteToggle,
    required this.favoriteMemes,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<Meme> memes = [];
  List<Meme> filteredMemes = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadMemes();

    _searchController.addListener(() {
      filterMemes();
    });
  }

  void loadMemes() async {
    final fetchedMemes = await apiService.fetchMemes();
    setState(() {
      memes = fetchedMemes.map((meme) => Meme.fromJson(meme)).toList();
      filteredMemes = memes;
    });
  }

  void filterMemes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredMemes = memes.where((meme) {
        return meme.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  void toggleFavoriteStatus(Meme meme) {
    setState(() {
      meme.toggleFavorite();
      widget.onFavoriteToggle(meme);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memes'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search memes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: filteredMemes.isEmpty
          ? Center(child: Text('No memes found.'))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredMemes.length,
                itemBuilder: (context, index) {
                  final meme = filteredMemes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MemeEditorScreen(meme: meme),
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
                                    child: Icon(Icons.broken_image,
                                        size: 50, color: Colors.grey),
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
                              Icons.favorite,
                              color: meme.isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () => toggleFavoriteStatus(meme),
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
