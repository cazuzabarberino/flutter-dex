import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/poke_details_screen.dart';
import 'package:pokedex/services/poke_api_service.dart';
import 'package:pokedex/utils/captalize.dart';
import 'package:pokedex/widgets/pokemon_type_row.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key, required this.pokemonId}) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  Pokemon? _currentPokemon;
  CancelableOperation<void>? _getPokemonOperation;

  Future<void> getPokemon() async {
    final pokemonRes = await pokeApiService.getPokemonById(widget.pokemonId);

    setState(() {
      _currentPokemon = pokemonRes;
    });
  }

  @override
  void initState() {
    _getPokemonOperation = CancelableOperation.fromFuture(
      getPokemon(),
      onCancel: null,
    );
    super.initState();
  }

  @override
  void dispose() {
    _getPokemonOperation?.cancel();
    super.dispose();
  }

  void goToPokemonDetails(Pokemon? pokemon, BuildContext context) {
    if (pokemon == null) return;
    Navigator.pushNamed(
      context,
      PokemonDetailsScreen.routeName,
      arguments: pokemon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon? pokemon = _currentPokemon;

    return GestureDetector(
      onTap: () => goToPokemonDetails(pokemon, context),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 96,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: (pokemon != null)
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: pokemon.boxColors,
                  )
                : null,
          ),
          child: pokemon == null
              ? const Center(child: CircularProgressIndicator())
              : _buildPokemonCardContent(pokemon),
        ),
      ),
    );
  }

  Widget _buildPokemonCardContent(Pokemon pokemon) {
    return Row(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: Hero(
            tag: "${pokemon.name}-image",
            child: Image.network(
              pokemon.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 4,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "${pokemon.name}-title",
                      child: Text(
                        pokemon.name.captalize(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Hero(
                      tag: "${pokemon.name}-types",
                      child: PokemonTypeRow(
                        types: pokemon.types,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -8,
                right: 0,
                child: Text(
                  "#${pokemon.id}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
