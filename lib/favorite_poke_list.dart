import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import 'models/pokemons_notifier.dart';
import 'models/favorite.dart';

class FavoritePokeList extends StatelessWidget {
  const FavoritePokeList({
    Key? key,
  }) : super(key: key);

  static const int more = 30;
  static List<Favorite> favMock = [
    Favorite(pokeId: 1),
    Favorite(pokeId: 4),
    Favorite(pokeId: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokemons, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: itemCount(pokemons.pokeCount) + 1,
        itemBuilder: (context, index) {
          if (index == itemCount(pokemons.pokeCount)) {
            return OutlinedButton(
              child: const Text('more'),
              onPressed: () =>
                  pokemons.updatePokeCount(pokemons.pokeCount + more),
            );
          } else {
            return PokeListItem(
              pokemon: pokemons.byId(favMock[index].pokeId),
            );
          }
        },
      ),
    );
  }

  int itemCount(int pokeCount) {
    int ret = pokeCount;
    if (ret > favMock.length) {
      ret = favMock.length;
    }
    return ret;
  }
}
