import 'package:shared_preferences/shared_preferences.dart';

class PreferencesBloc {
  final String _kSortingOrderPrefs = "sortOrder";
  final String _kReadsPrefs = "reads";
  final String _kFavouritesPrefs = "favourites";

  Future<List<String>> getReads() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_kReadsPrefs) ?? [];
  }

  Future<bool> setRead(String newRead) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> reads = await getReads();
    reads.add(newRead);

    return prefs.setStringList(_kReadsPrefs, reads);
  }

  Future<List<String>> getFavourites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_kReadsPrefs) ?? [];
  }

  Future<bool> setFavourite(String fav) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favourites = await getFavourites();
    favourites.add(fav);

    return prefs.setStringList(_kFavouritesPrefs, favourites);
  }
}
