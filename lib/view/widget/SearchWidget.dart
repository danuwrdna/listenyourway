import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listenyourway/model/GenreApiDeezer.dart';
import 'package:listenyourway/view/page/SearchPage.dart';
import 'package:listenyourway/viewmodel/SearchViewModel.dart'; // Import your SearchViewModel

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final SearchViewModel _searchViewModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 147, vertical: 10),
              ),
              child: Text(
                "Search",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        FutureBuilder<List<ListGenre>>(
          future: _searchViewModel.fetchGenres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No genres available');
            } else {
              // Modify this part based on your ListGenre structure
              return _buildGenresContainer(
                snapshot.data!,
                "Browse All",
                EdgeInsets.only(top: 5, left: 10, right: 250),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildGenresContainer(
      List<ListGenre> genres, String title, EdgeInsetsGeometry margin) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: margin,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          runSpacing: 5.0, // Set spacing between rows
          children: genres.map((genre) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      genre.picture,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      genre.name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
