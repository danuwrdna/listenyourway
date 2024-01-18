import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listenyourway/model/ArtistApiDeezer.dart';

class HomeViewModel {
  static Future<List<ArtistApiDeezer>> fetchDataForMultipleArtists() async {
    final baseUrl = 'https://api.deezer.com/artist/';
    List<ArtistApiDeezer> artists = [];

    for (int artistId = 1; artistId <= 13; artistId++) {
      final apiUrl = '$baseUrl$artistId';

      try {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          final dynamic data = json.decode(response.body);

          if (data is Map<String, dynamic> && data.containsKey('id')) {
            ArtistApiDeezer artist = ArtistApiDeezer.fromJson(data);
            artists.add(artist);
          } else {
            print('Invalid data for artist ID: $artistId');
          }
        } else {
          print(
              'Failed to fetch data for artist ID: $artistId, HTTP Status: ${response.statusCode}');
        }
      } catch (error) {
        print('Failed to fetch data for artist ID: $artistId, Error: $error');
      }
    }

    return artists;
  }
}
