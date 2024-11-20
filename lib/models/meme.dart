class Meme {
  final String id;
  final String name;
  final String url;
  bool isFavorite;

  Meme({
    required this.id,
    required this.name,
    required this.url,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  // Fungsi untuk parsing dari JSON
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
