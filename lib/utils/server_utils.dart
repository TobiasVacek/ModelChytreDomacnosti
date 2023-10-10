import 'package:http/http.dart' as http;
import 'dart:convert';

const url = "http://chytrodum.cz/getData";

Future<Album?> fetchAlbum() async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return null;
    }
  } catch (e) {
    return null;
  }
}

class Album {
  final double temperature;
  final int curtains;
  final List light;

  const Album({
    required this.temperature,
    required this.curtains,
    required this.light,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      temperature: json['temperature'],
      curtains: json['curtains'],
      light: json['light'],
    );
  }
}
