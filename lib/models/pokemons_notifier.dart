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
  int _pokeCount = 30;
  int _favoritePokeCount = 30;

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
    if (_pokeCount < pokeMaxId) _pokeCount += 30;
    notifyListeners();
  }

  void updateFavoritePokeList() {
    if (_favoritePokeCount < _favs.length) _favoritePokeCount += 30;
    notifyListeners();
  }

  int listItemCount(int pokeCount, int max) {
    return isLastPage(pokeCount, max) ? max : pokeCount + 1;
  }

  bool isLastPage(int pokeCount, int max) {
    return pokeCount >= max;
  }

  void toggleFavorite(Favorite fav) {
    if (isFavorite(fav.pokeId)) {
      deleteFavorite(fav.pokeId);
    } else {
      addFavorite(fav);
    }
  }

  bool isFavorite(int id) {
    return _favs.indexWhere((fav) => fav.pokeId == id) >= 0;
  }

  void syncDb() async {
    FavoritesDb.read().then(
      (val) => _favs
        ..clear()
        ..addAll(val),
    );
    notifyListeners();
  }

  void deleteFavorite(int id) {
    _favs.removeWhere((fav) => fav.pokeId == id);
    notifyListeners();
  }
}
