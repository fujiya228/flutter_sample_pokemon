import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './top_page.dart';
import './theme_mode_notifyer.dart';
import './preference_helper.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeModeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then((val) => setState(() => themeMode = val));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Pictorial Book',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const TopPage(),
    );
  }
}
