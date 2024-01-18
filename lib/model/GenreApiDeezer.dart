// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GenreApiDeezer welcomeFromJson(String str) =>
    GenreApiDeezer.fromJson(json.decode(str));

String welcomeToJson(GenreApiDeezer data) => json.encode(data.toJson());

class GenreApiDeezer {
  List<ListGenre> data;

  GenreApiDeezer({
    required this.data,
  });

  factory GenreApiDeezer.fromJson(Map<String, dynamic> json) => GenreApiDeezer(
        data: List<ListGenre>.from(
            json["data"].map((x) => ListGenre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ListGenre {
  String id;
  String name;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  Type type;

  ListGenre({
    required this.id,
    required this.name,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.type,
  });

  factory ListGenre.fromJson(Map<String, dynamic> json) => ListGenre(
        id: json["id"].toString(),
        name: json["name"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "type": typeValues.reverse[type],
      };
}

enum Type { GENRE }

final typeValues = EnumValues({"genre": Type.GENRE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
