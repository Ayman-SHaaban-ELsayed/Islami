//write data => save data
import 'package:shared_preferences/shared_preferences.dart';

void saveLastSuraIndex(int newSuraIndex) async {
  var prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList('most-recent') ?? [];
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
  }
  mostRecentList.insert(0, '$newSuraIndex');
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  await prefs.setStringList('most-recent', mostRecentList);
}

// Future<List<int>> readMostRecent() async {
//   var prefs = await SharedPreferences.getInstance();
//   List<String> mostRecentStringList = prefs.getStringList('most-recent') ?? [];
//   List<int> mostRecentIntList = mostRecentStringList.map((toElement) {
//     return int.parse(toElement);
//   }).toList();
//   return mostRecentIntList;
// }
