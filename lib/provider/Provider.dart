import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:daily_recipes2/models/ad.model.dart';
class AdsProvider with ChangeNotifier {
  List<Ad> _adsList = [];

  List<Ad> get adsList => _adsList;

  Future<void> loadAdsList() async {
    final adsData = await rootBundle.loadString('assets/data/sample.json');
    final List<dynamic> jsonData = json.decode(adsData)['ads'];

    _adsList = jsonData.map((item) => Ad.fromJson(item)).toList();

    notifyListeners();
  }
}


