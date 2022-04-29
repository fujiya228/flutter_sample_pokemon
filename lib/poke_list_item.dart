import 'package:flutter/material.dart';
import './poke_detail.dart';
import './consts/pokeapi.dart';
import './models/pokemon.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      subtitle: Text(pokemon!.types.first),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokeDetail(),
          ),
        ),
      },
    );
  }
}
