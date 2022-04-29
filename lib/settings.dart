import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme_mode_selection_page.dart';
import 'models/theme_mode_notifier.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => ListView(children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Light/Dark Mode'),
          trailing: Text(_themeModeTraillingText(mode)),
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ThemeModeSelectionPage(),
            )),
          },
        ),
      ]),
    );
  }

  _themeModeTraillingText(mode) {
    switch (mode.mode) {
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
