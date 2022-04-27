import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/theme_mode_notifyer.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({Key? key}) : super(key: key);

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              RadioListTile(
                title: const Text('System'),
                value: ThemeMode.system,
                groupValue: mode.mode,
                onChanged: (_) => mode.update(ThemeMode.system),
              ),
              RadioListTile(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: mode.mode,
                onChanged: (_) => mode.update(ThemeMode.light),
              ),
              RadioListTile(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: mode.mode,
                onChanged: (_) => mode.update(ThemeMode.dark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
