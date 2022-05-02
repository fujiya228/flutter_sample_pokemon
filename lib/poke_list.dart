import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import 'consts/pokeapi.dart';
import 'models/pokemons_notifier.dart';

class PokeList extends StatelessWidget {
  const PokeList({
    Key? key,
  }) : super(key: key);

  static const int more = 30;

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokemons, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: listItemCount(pokemons.pokeCount),
        itemBuilder: (context, index) {
          if (index == pokemons.pokeCount) {
            return OutlinedButton(
              child: const Text('more'),
              onPressed: () =>
                  pokemons.updatePokeCount(pokemons.pokeCount + more),
            );
          } else {
            return PokeListItem(
              pokemon: pokemons.byId(index + 1),
            );
          }
        },
      ),
    );
  }

  int listItemCount(int pokeCount) {
    return isLastPage(pokeCount) ? pokeCount : pokeCount + 1;
  }

  bool isLastPage(int pokeCount) {
    return pokeCount == pokeMaxId;
  }
}
