import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetailsScreen extends StatelessWidget {
  static const String routeName = "/pokemon-details";

  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Hero(
        tag: pokemon.name,
        child: Image.network(pokemon.imageUrl),
      ),
    );
  }
}
