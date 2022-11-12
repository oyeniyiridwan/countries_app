import 'dart:convert';
import 'package:countries_app/Country.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Countries with ChangeNotifier {
  List<Country> _items = [];

  List<Country> get items {
    return [..._items];
  }

  Future<void> fetchCountries() async {
    var dio = Dio();
    final url = Uri.parse("https://restcountries.com/v3.1/all");
    final List<Country> loadedCountry = [];
    try {
      // final response = await dio.get("https://restcountries.com/v3.1/all");
      final response = await http.get(url);
      final extractData = json.decode(response.body.toString());
      if (extractData.toString() == "") {
        return;
      }

      // print(extractData[1]["name"]["common"].toString());
      for (int i = 0; i < 20; i++) {
        List<String> language = [];
        var currency;
        for (var value in extractData[i]["languages"].values) {
          language.add(value);
        }
        language.removeLast();

        for (var value in extractData[i]["currencies"].values) {
          currency = value["name"]!;
        }

        loadedCountry.add(Country(
            name: extractData[i]["name"]["common"],
            capital: extractData[i]["capital"][0],
            timezones: extractData[i]["timezones"][0],
            currency: currency,
            region: extractData[i]["region"],
            subRegion: extractData[i]["subregion"],
            population: extractData[i]["population"],
            area: extractData[i]["area"],
            dialingCode: extractData[i]["idd"]["root"] +
                extractData[i]["idd"]["suffixes"][0],
            carSide: extractData[i]["car"]["side"],
            ethic: extractData[i]["demonyms"]["eng"]["f"],
            language: language,
            independent: extractData[i]["independent"],
            imageUrl: [
              extractData[i]["flags"]["png"],
              extractData[i]["coatOfArms"]["png"].toString(),
              // extractData[i]["maps"]["googleMaps"],
            ]));
      }
      loadedCountry.sort((a, b) => a.name.compareTo(b.name));
      _items = loadedCountry;
      notifyListeners();
      // print(loadedCountry[1].currency);
    } catch (error) {
      rethrow;
    }
  }
}
