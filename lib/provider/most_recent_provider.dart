import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readMostRecent() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringList =
        prefs.getStringList('most-recent') ?? [];
    mostRecentList = mostRecentStringList.map((toElement) {
      return int.parse(toElement);
    }).toList();
    // print('xxxxx $mostRecentStringList');
    notifyListeners();
  }
}
