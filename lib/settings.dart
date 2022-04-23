import 'package:flutter/material.dart';
import './theme_mode_selection_page.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
