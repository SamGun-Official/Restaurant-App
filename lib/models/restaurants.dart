import 'dart:convert';
import 'menus.dart';

class Restaurants {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurants(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menus: Menus.fromJson(json['menus']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    data['menus'] = menus;
    return data;
  }
}

List<Restaurants> parseData(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}
