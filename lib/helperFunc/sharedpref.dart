import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late final SharedPreferences _pref;

  Future<SharedPref> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }
}
