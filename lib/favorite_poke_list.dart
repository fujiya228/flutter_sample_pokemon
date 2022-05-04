import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import './help.dart';
import 'models/pokemons_notifier.dart';

class FavoritePokeList extends StatelessWidget {
  const FavoritePokeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Help(helpMessage: 'お気に入りのポケモンが表示されています'),
        Expanded(
          child:
              Consumer<PokemonsNotifier>(builder: (context, pokemons, child) {
            if (pokemons.favoritePokeListItemCount == 0) {
              return const Text('お気に入り登録されたポケモンはいません');
            } else {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                itemCount: pokemons.favoritePokeListItemCount,
                itemBuilder: (context, index) {
                  if (index == pokemons.favoritePokeCount) {
                    return OutlinedButton(
                      child: const Text('more'),
                      onPressed: () => pokemons.updateFavoritePokeList(),
                    );
                  } else {
                    return PokeListItem(
                      pokemon: pokemons.favoritePokeByIndex(index),
                    );
                  }
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
