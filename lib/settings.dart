import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _bgmEnabled = true;
  double _volume = 0.5;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bgmEnabled = prefs.getBool('bgmEnabled') ?? true;
      _volume = prefs.getDouble('volume') ?? 0.5;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('bgmEnabled', _bgmEnabled);
    prefs.setDouble('volume', _volume);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF404040),
      ),
      backgroundColor: Color(0xFF404040),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('BGM Enabled', style: TextStyle(color: Colors.white)),
              value: _bgmEnabled,
              onChanged: (bool value) {
                setState(() {
                  _bgmEnabled = value;
                });
                _saveSettings();
              },
              activeColor: Colors.orange,
            ),
            const SizedBox(height: 20),
            Text('Volume', style: TextStyle(color: Colors.white)),
            Slider(
              value: _volume,
              min: 0,
              max: 1,
              divisions: 10,
              label: (_volume * 100).toInt().toString(),
              onChanged: (double value) {
                setState(() {
                  _volume = value;
                });
                _saveSettings();
              },
              activeColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
