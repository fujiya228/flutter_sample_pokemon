import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme_mode_selection_page.dart';
import './theme_mode_notifyer.dart';

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
          onTap: () async {
            var ret = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage(mode: mode.mode),
              ),
            );
            if (ret != null) {
              mode.update(ret);
            }
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
