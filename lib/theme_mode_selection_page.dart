import 'package:flutter/material.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  final ThemeMode mode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  late ThemeMode _currentThemeMode;

  @override
  void initState() {
    super.initState();
    _currentThemeMode = widget.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    Navigator.pop<ThemeMode>(context, _currentThemeMode),
              ),
            ),
            RadioListTile(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: _currentThemeMode,
              onChanged: (value) => _onRadioSelected(value),
            ),
            RadioListTile(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: _currentThemeMode,
              onChanged: (value) => _onRadioSelected(value),
            ),
            RadioListTile(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: _currentThemeMode,
              onChanged: (value) => _onRadioSelected(value),
            ),
          ],
        ),
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      _currentThemeMode = value;
    });
  }
}
