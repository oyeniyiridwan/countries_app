import 'dart:convert';
import 'package:countries_app/Model/Country.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Countries with ChangeNotifier {
  List<Country> _items = [];
  List<Country> _filtered = [];
  List<Country> _search = [];
  List<Country> get items {
    return [..._search];
  }

  bool _isDarkMode = true;
  get isDarkMode {
    return _isDarkMode;
  }

  void setDarkMode() {
    _isDarkMode = true;
    notifyListeners();
  }

  void setLightMode() {
    _isDarkMode = false;
    notifyListeners();
  }

  List<String> regionL = [];
  List<String> subRegionL = [];
  List<String> capitalL = [];
  List<String> currencyL = [];
  List<bool> checks = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void toggle(int i) {
    checks[i] = !checks[i];
    notifyListeners();
  }

  void clear() {
    for (int i = 0; i < checks.length; i++) {
      checks[i] = false;
    }
    regionL = [];
    subRegionL = [];
    capitalL = [];
    currencyL = [];
    notifyListeners();
  }

  void filtered() {
    if (regionL.isEmpty) {
      _filtered = _items;
    }
    if (regionL.isNotEmpty) {
      _filtered = [];
      for (int i = 0; i < regionL.length; i++) {
        _filtered.addAll(_items.where((country) {
          return country.region == regionL[i];
        }).toList());
        _filtered.sort((a, b) => a.name.compareTo(b.name));
      }
    }
    if (subRegionL.isNotEmpty) {
      List<Country> temp = [];
      for (int j = 0; j < subRegionL.length; j++) {
        temp.addAll(_filtered.where((country) {
          return country.subRegion == subRegionL[j];
        }).toList());
      }
      temp.sort((a, b) => a.name.compareTo(b.name));
      _filtered = temp;
    }
    if (capitalL.isNotEmpty) {
      List<Country> temp = [];
      for (int k = 0; k < capitalL.length; k++) {
        temp.addAll(_filtered.where((country) {
          return country.capital == capitalL[k];
        }).toList());
      }
      temp.sort((a, b) => a.name.compareTo(b.name));
      _filtered = temp;
    }
    if (currencyL.isNotEmpty) {
      List<Country> temp = [];
      for (int l = 0; l < currencyL.length; l++) {
        temp.addAll(_filtered.where((country) {
          return country.currency == currencyL[l];
        }).toList());
      }
      temp.sort((a, b) => a.name.compareTo(b.name));
      _filtered = temp;
    }
    _search = _filtered;
    notifyListeners();
  }

  void onChange(value) {
    if (value.isEmpty) {
      _search = _filtered;
    } else {
      _search = _filtered.where((country) {
        return country.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    notifyListeners();

    // setState(() {
    //   result = temp;
    // });
    // print(result.length);
  }

  Future<void> fetchCountries() async {
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
      for (int i = 0; i < 25; i++) {
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
      _filtered = loadedCountry;
      _search = loadedCountry;
      notifyListeners();
      // print(loadedCountry[1].currency);
    } catch (error) {}
  }
}
