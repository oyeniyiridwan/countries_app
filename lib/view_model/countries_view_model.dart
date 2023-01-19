import 'dart:convert';
import 'package:countries_app/Model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CountriesViewModel with ChangeNotifier {
  List<Country> _items = [];
  List<Country> _filtered = [];
  List<Country> _search = [];
  List<Country> get items {
    return [..._search];
  }
  bool _isLoading = true;
  bool get isLoading =>_isLoading;


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

  var currency = "";

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
        _filtered.sort((a, b) => a.name!.common.toString().compareTo(b.name!.common.toString()));
      }
    }
    if (subRegionL.isNotEmpty) {
      List<Country> temp = [];
      for (int j = 0; j < subRegionL.length; j++) {
        temp.addAll(_filtered.where((country) {
          return country.subregion == subRegionL[j];
        }).toList());
      }
      temp.sort((a, b) => a.name!.common.toString().compareTo(b.name!.common.toString()));
      _filtered = temp;
    }
    if (capitalL.isNotEmpty) {
      List<Country> temp = [];
      for (int k = 0; k < capitalL.length; k++) {
        temp.addAll(_filtered.where((country) {
          return country.capital?[0] == capitalL[k];
        }).toList());
      }
      temp.sort((a, b) => a.name!.common.toString().compareTo(b.name!.common.toString()));
      _filtered = temp;
    }
    if (currencyL.isNotEmpty) {
      List<Country> temp = [];
      for (int l = 0; l < currencyL.length; l++) {
        temp.addAll(_filtered.where((country) {
          return country.currencies == currencyL[l];
        }).toList());
      }
      temp.sort((a, b) => a.name!.common.toString().compareTo(b.name!.common.toString()));
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
        return country.name!.common.toString().toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    notifyListeners();

  }

  Future<void> fetchCountries() async {
    final url = Uri.parse("https://restcountries.com/v3.1/all");
    final List<Country> loadedCountry = [];
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body.toString());
      if (extractData.toString() == "") {
        return;
      }

      for (var item in extractData){
        loadedCountry.add(Country.fromJson(item));
      }
      loadedCountry.sort((a,b) => a.name!.common.toString().compareTo(b.name!.common.toString()));
      _items = loadedCountry;
      _filtered = loadedCountry;
      _search = loadedCountry;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
