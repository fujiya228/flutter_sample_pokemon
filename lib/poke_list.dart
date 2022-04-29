import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import 'models/pokemons_notifier.dart';

class PokeList extends StatelessWidget {
  const PokeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokemons, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return PokeListItem(pokemon: pokemons.byId(index + 1));
        },
      ),
    );
  }
}
