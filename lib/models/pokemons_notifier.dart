import 'package:flutter/material.dart';
import './pokemon.dart';
import '../api/pokeapi.dart';

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon> _pokeMap = {};

  Map<int, Pokemon> get pokes => _pokeMap;

  void addPokemon(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    addPokemon(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }
}
