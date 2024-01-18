import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listenyourway/model/ArtistApiDeezer.dart';
import 'package:listenyourway/viewmodel/HomeViewModel.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<List<ArtistApiDeezer>> _artistsData;

  @override
  void initState() {
    super.initState();
    _artistsData = HomeViewModel.fetchDataForMultipleArtists();
  }

  Widget _buildArtistsContainer(
      List<ArtistApiDeezer> artists, String title, EdgeInsetsGeometry margin) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artists.length,
            itemBuilder: (context, index) {
              ArtistApiDeezer artist = artists[index];
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 13, 110, 16).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        artist.picture,
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      artist.name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      artist.type,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistApiDeezer>>(
      future: _artistsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error1: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildArtistsContainer(snapshot.data!.sublist(0, 9),
                    "Listen Your Way", EdgeInsets.only(top: 50, left: 10)),
                _buildArtistsContainer(snapshot.data!.sublist(3, 6),
                    "Recently Played", EdgeInsets.only(top: 10, left: 10)),
                _buildArtistsContainer(snapshot.data!.sublist(4, 10),
                    "Your Music", EdgeInsets.only(top: 10, left: 10)),
                _buildArtistsContainer(snapshot.data!.sublist(3, 7),
                    "Your Music", EdgeInsets.only(top: 10, left: 10))
              ],
            ),
          );
        }
      },
    );
  }
}
