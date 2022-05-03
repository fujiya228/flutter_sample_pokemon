import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import 'models/pokemons_notifier.dart';

class FavoritePokeList extends StatelessWidget {
  const FavoritePokeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 24,
          alignment: Alignment.topRight,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.help_outline_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 5,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Text(
                              'お気に入りのポケモンが表示されています',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                            child: const Text('閉じる'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: Consumer<PokemonsNotifier>(
            builder: (context, pokemons, child) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
            ),
          ),
        ),
      ],
    );
  }
}
