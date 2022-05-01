import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './top_page.dart';
import 'models/theme_mode_notifier.dart';
import 'models/pokemons_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier(pref);
  final pokemonsNotifier = PokemonsNotifier();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModeNotifier>(
        create: (context) => themeModeNotifier,
      ),
      ChangeNotifierProvider<PokemonsNotifier>(
        create: (context) => pokemonsNotifier,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => MaterialApp(
        title: 'Pokémon Pictorial Book',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: mode.mode,
        home: const TopPage(),
      ),
    );
  }
}
