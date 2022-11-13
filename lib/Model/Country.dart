import 'package:flutter/material.dart';

class Country with ChangeNotifier {
  String name;
  String capital;
  String timezones;
  String? currency;
  String region;
  String? subRegion;
  int population;
  double area;
  String dialingCode;
  String carSide;
  String ethic;
  List<String> language;
  dynamic independent;
  List<String?> imageUrl;
  Country(
      {required this.name,
      required this.capital,
      required this.timezones,
      required this.currency,
      required this.region,
      required this.subRegion,
      required this.population,
      required this.area,
      required this.dialingCode,
      required this.carSide,
      required this.ethic,
      required this.language,
      required this.independent,
      required this.imageUrl});
}
