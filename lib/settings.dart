import 'package:flutter/material.dart';
import './theme_mode_selection_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Light/Dark Mode'),
          onTap: () async {
            final ret = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ThemeModeSelectionPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
