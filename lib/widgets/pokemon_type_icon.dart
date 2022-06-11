import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_icons.dart';

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    final typeData = getPokemonTypeData(type);

    return Card(
      shape: const CircleBorder(),
      color: typeData.color,
      elevation: 2,
      margin: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 32,
        height: 32,
        child: Image.asset(
          typeData.assetPath,
        ),
      ),
    );
  }
}
