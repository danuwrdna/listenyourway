import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listenyourway/model/GenreApiDeezer.dart';

class SearchViewModel {
  Future<void> fetchData(String query) async {
    final url = Uri.parse('https://api.deezer.com/search?q=$query');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Data berhasil diambil
        final data = json.decode(response.body);
        // Proses data sesuai kebutuhan Anda
        print(data);
      } else {
        // Jika request tidak berhasil
        print('Gagal mengambil data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan koneksi atau lainnya
      print('Error: $e');
    }
  }

  Future<List<ListGenre>> fetchGenres() async {
    final url = Uri.parse('https://api.deezer.com/genre');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Data berhasil diambil
        final data = json.decode(response.body);
        // Proses data sesuai kebutuhan Anda
        List<ListGenre> genres = List<ListGenre>.from(
            data["data"].map((x) => ListGenre.fromJson(x)));
        return genres;
      } else {
        // Jika request tidak berhasil
        print('Gagal mengambil data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Tangani kesalahan koneksi atau lainnya
      print('Error: $e');
      return [];
    }
  }
}

// Add the ListGenre class and related code here (from your original code)
