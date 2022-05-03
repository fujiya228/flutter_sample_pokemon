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

  int get pokeCount => _pokeCount;
  int get pokeListItemCount => listItemCount(_pokeCount, pokeMaxId);
  int get favoritePokeCount => _favoritePokeCount;
  int get favoritePokeListItemCount =>
      listItemCount(_favoritePokeCount, favMock.length);

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
    return byId(favMock[index].pokeId);
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

  int listItemCount(int pokeCount, int max) {
    return isLastPage(pokeCount, max) ? pokeCount : pokeCount + 1;
  }

  bool isLastPage(int pokeCount, int max) {
    return pokeCount == max;
  }
}
