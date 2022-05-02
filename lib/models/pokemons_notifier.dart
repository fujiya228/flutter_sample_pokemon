import 'package:flutter/material.dart';
import './pokemon.dart';
import '../api/pokeapi.dart';
import '../consts/pokeapi.dart';
import '../models/favorite.dart';

final Pokemon defaultPokemon = Pokemon(
    id: 0,
    name: 'loading...',
    types: ['loading...'],
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/0.png');

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon> _pokeMap = {};
  int _pokeCount = 30;
  int _favoritePokeCount = favMock.length < 30 ? favMock.length : 30;

  Map<int, Pokemon> get pokes => _pokeMap;
  int get pokeCount => _pokeCount;
  int get favoritePokeCount => _favoritePokeCount;

  void addPokemon(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = defaultPokemon;
    addPokemon(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }

  void updatePokeList() {
    _pokeCount += 30;
    if (_pokeCount > pokeMaxId) {
      _pokeCount = pokeMaxId;
    }
    notifyListeners();
  }

  void updateFavoritePokeList() {
    _favoritePokeCount += 30;
    if (_favoritePokeCount > favMock.length) {
      _favoritePokeCount = favMock.length;
    }
    notifyListeners();
  }
}
