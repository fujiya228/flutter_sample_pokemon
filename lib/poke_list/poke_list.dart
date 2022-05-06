import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../poke_list_item.dart';
import '../help.dart';
import '../models/pokemons_notifier.dart';

class PokeList extends StatelessWidget {
  const PokeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Help(helpMessage: 'すべてのポケモンが表示されています'),
        Expanded(
          child: Consumer<PokemonsNotifier>(
            builder: (context, pokemons, child) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: pokemons.pokeListItemCount,
              itemBuilder: (context, index) {
                if (index == pokemons.pokeCount) {
                  return OutlinedButton(
                    child: const Text('more'),
                    onPressed: () => pokemons.updatePokeList(),
                  );
                } else {
                  return PokeListItem(
                    pokemon: pokemons.byId(index + 1),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
