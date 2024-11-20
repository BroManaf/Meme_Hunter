import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Start with LoginScreen
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Meme> favoriteMemes = []; // Initialize favorite list

  void toggleFavorite(Meme meme) {
    setState(() {
      if (meme.isFavorite) {
        favoriteMemes.add(meme); // Add to favorites
      } else {
        favoriteMemes.removeWhere((item) => item.id == meme.id); // Remove from favorites
      }
    });
  }

  void removeFavorite(Meme meme) {
    setState(() {
      favoriteMemes.removeWhere((item) => item.id == meme.id); // Remove from favorites
      meme.isFavorite = false; // Update the meme's favorite status
    });
  }

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Pass both onFavoriteToggle and favoriteMemes to HomeScreen
    _screens = [
      HomeScreen(
        onFavoriteToggle: toggleFavorite,
        favoriteMemes: favoriteMemes,
      ),
      FavoriteScreen(
        favoriteMemes: favoriteMemes,
        onRemoveFavorite: removeFavorite, // Pass removeFavorite function
      ),
      ProfileScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
