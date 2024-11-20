import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.imgflip.com/get_memes';

  Future<List<dynamic>> fetchMemes() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['memes'];
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
