import 'dart:ui';

import 'package:pokedex/constants/pokemon_icons.dart';
import 'package:pokedex/utils/color_manipulation.dart';

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.spriteUrl,
  }) {
    _boxColors =
        types.map((e) => getPokemonTypeData(e).color.lighten(.1)).toList();
    if (_boxColors.length == 1) {
      _boxColors.add(_boxColors[0].darken(.2));
    }
  }

  final String name;
  final String imageUrl;
  final String spriteUrl;
  final List<String> types;
  final int id;
  late List<Color> _boxColors;
  List<Color> get boxColors => _boxColors;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json["id"],
      name: json['name'],
      imageUrl: json["sprites"]["other"]["official-artwork"]["front_default"],
      spriteUrl: json["sprites"]["front_default"],
      types: (json["types"] as List)
          .map((e) => e["type"]["name"].toString())
          .toList(),
    );
  }
}
