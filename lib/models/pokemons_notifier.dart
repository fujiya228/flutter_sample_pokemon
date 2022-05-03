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
  final List<Favorite> _favs = [];
  int _pokeCount = 0;
  int _favoritePokeCount = 0;

  PokemonsNotifier() {
    _pokeCount = 30;
    _favoritePokeCount = _favs.length < 30 ? _favs.length : 30;
  }

  int get pokeCount => _pokeCount;
  int get pokeListItemCount => listItemCount(_pokeCount, pokeMaxId);
  int get favoritePokeCount => _favoritePokeCount;
  int get favoritePokeListItemCount =>
      listItemCount(_favoritePokeCount, _favs.length);

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

  Pokemon? favoritePokeByIndex(int index) {
    return byId(_favs[index].pokeId);
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
    if (_favoritePokeCount > _favs.length) {
      _favoritePokeCount = _favs.length;
    }
    notifyListeners();
  }

  int listItemCount(int pokeCount, int max) {
    return isLastPage(pokeCount, max) ? pokeCount : pokeCount + 1;
  }

  bool isLastPage(int pokeCount, int max) {
    return pokeCount == max;
  }
}
