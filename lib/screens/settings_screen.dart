import 'package:flutter/material.dart';
import '../models/game_settings.dart';
import '../services/settings_service.dart';
import '../widgets/setting_row.dart';

class GameSettingsScreen extends StatefulWidget {
  const GameSettingsScreen({super.key});

  @override
  State<GameSettingsScreen> createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  final SettingsService _service = SettingsService();

  GameSettings _settings = GameSettings(
    amThanh: false,
    tuDongLuu: false,
    diemCaoNhat: 3500,
    volume: 50,
  );

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await _service.loadSettings();
    setState(() => _settings = data);
  }

  Future<void> _saveData() async {
    await _service.saveSettings(_settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cấu hình game đố vui'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            /// Âm thanh
            SettingRow(
              title: 'Âm thanh',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _settings.amThanh,
                    onChanged: (value) {
                      setState(() => _settings.amThanh = value ?? false);
                      _saveData();
                    },
                  ),
                  const Text('Bật'),
                ],
              ),
            ),

            /// Điểm cao nhất
            SettingRow(
              title: 'Điểm cao nhất',
              trailing: Text(
                '${_settings.diemCaoNhat}',
                style: const TextStyle(fontSize: 16),
              ),
            ),

            /// Tự động lưu game
            SettingRow(
              title: 'Tự động lưu game',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _settings.tuDongLuu,
                    onChanged: (value) {
                      setState(() => _settings.tuDongLuu = value ?? false);
                      _saveData();
                    },
                  ),
                  const Text('Bật'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Volume
            const Text(
              'Volume',
              style: TextStyle(fontSize: 16),
            ),

            Slider(
              value: _settings.volume,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() => _settings.volume = value);
              },
              onChangeEnd: (value) => _saveData(),
            ),
          ],
        ),
      ),
    );
  }
}