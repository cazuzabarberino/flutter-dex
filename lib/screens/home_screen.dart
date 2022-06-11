import 'package:flutter/material.dart';
import 'package:pokedex/services/poke_api_service.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const firstId = 1;
    final lastId = pokeApiService.getTotalPokemonSpecies();

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),
      body: ListView.builder(
        itemExtent: 104,
        itemBuilder: (context, index) => PokemonCard(
          pokemonId: index + firstId,
          key: Key((index + firstId).toString()),
        ),
        itemCount: (lastId - firstId + 1),
      ),
    );
  }
}
