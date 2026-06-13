import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettingsProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Beállítások')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Sötét mód'),
              value: settings.darkMode,
              onChanged: (_) => settings.toggleDarkMode(),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: settings.language,
              items: const [
                DropdownMenuItem(value: 'hu', child: Text('Magyar')),
                DropdownMenuItem(value: 'en', child: Text('English')),
              ],
              onChanged: (v) => settings.setLanguage(v!),
            ),
          ],
        ),
      ),
    );
  }
}
