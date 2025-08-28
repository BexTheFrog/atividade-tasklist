import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // O metodo "final" define que a variavel terá apenas este valor, é final que preferences é igual a SharedPreferences.getInstance();

  static final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  static Future<void> setStringLocalStorage(String dados, String chave) async {
    SharedPreferences preferences = await _preferences;
    preferences.setString(chave, dados);
  }

  static Future<String?> getStringLocalStorage(String chave) async {
    SharedPreferences preferences = await _preferences;
    return preferences.getString(chave);
  }

  static Future<bool> setIntLocalStorage(String chave, int dados) async {
    SharedPreferences preferences = await _preferences;
    return preferences.setInt(chave, dados);
  }
}
