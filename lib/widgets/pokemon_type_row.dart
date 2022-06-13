import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_type_icon.dart';

class PokemonTypeRow extends StatelessWidget {
  const PokemonTypeRow({Key? key, required this.types}) : super(key: key);
  final List<String> types;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: types.map((e) => PokemonTypeIcon(type: e)).toList(),
    );
  }
}
