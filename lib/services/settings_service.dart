import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_settings.dart';

class SettingsService {
  static const String keyAmThanh = 'am_thanh';
  static const String keyTuDongLuu = 'tu_dong_luu';
  static const String keyVolume = 'volume';

  Future<GameSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return GameSettings(
      amThanh: prefs.getBool(keyAmThanh) ?? false,
      tuDongLuu: prefs.getBool(keyTuDongLuu) ?? false,
      diemCaoNhat: 3500,
      volume: prefs.getDouble(keyVolume) ?? 50.0,
    );
  }

  Future<void> saveSettings(GameSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyAmThanh, settings.amThanh);
    await prefs.setBool(keyTuDongLuu, settings.tuDongLuu);
    await prefs.setDouble(keyVolume, settings.volume);
  }
}