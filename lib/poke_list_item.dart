import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './poke_detail.dart';
import './consts/pokeapi.dart';
import './models/pokemon.dart';
import './models/favorite.dart';
import './models/pokemons_notifier.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokemons, child) => ListTile(
        leading: Container(
          width: 80,
          decoration: BoxDecoration(
            color: (pokeTypeColors[pokemon!.types.first] ?? Colors.grey[100])
                ?.withOpacity(.6),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                pokemon!.imageUrl,
              ),
            ),
          ),
        ),
        title: Text(
          pokemon!.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(pokemon!.types.join(', ')),
        trailing: IconButton(
          icon: pokemons.isFavorite(pokemon!.id)
              ? const Icon(Icons.star, size: 18, color: Colors.orangeAccent)
              : const Icon(Icons.star_outline, size: 18),
          onPressed: () =>
              pokemons.toggleFavorite(Favorite(pokeId: pokemon!.id)),
        ),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => PokeDetail(pokemon: pokemon!),
            ),
          ),
        },
      ),
    );
  }
}
