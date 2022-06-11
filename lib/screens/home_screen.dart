import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonIds = List.generate(1000, (i) => i + 1);

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),
      body: ListView.builder(
        itemExtent: 104,
        itemBuilder: (context, index) => PokemonCard(
          pokemonId: pokemonIds[index],
          key: Key(pokemonIds[index].toString()),
        ),
        itemCount: pokemonIds.length,
      ),
    );
  }
}
