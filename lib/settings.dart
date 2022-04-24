import 'package:flutter/material.dart';
import './theme_mode_selection_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Light/Dark Mode'),
          trailing: Text(_themeModeTraillingText()),
          onTap: () async {
            var ret = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage(mode: _themeMode),
              ),
            );
            setState(() => _themeMode = ret!);
            await saveThemeMode(_themeMode);
          },
        ),
      ],
    );
  }

  _themeModeTraillingText() {
    switch (_themeMode) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      default:
        return 'System';
    }
  }
}
