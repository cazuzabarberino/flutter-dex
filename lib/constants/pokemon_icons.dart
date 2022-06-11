import 'package:flutter/material.dart';

class PokemonTypeData {
  const PokemonTypeData({
    required this.assetPath,
    required this.color,
  });

  final String assetPath;
  final Color color;
}

const Map<String, PokemonTypeData> pokemonTypeData = {
  "bug": PokemonTypeData(
    assetPath: "assets/pokemon_icons/bug.png",
    color: Color.fromRGBO(132, 196, 0, 1),
  ),
  "dark": PokemonTypeData(
    assetPath: "assets/pokemon_icons/dark.png",
    color: Color.fromRGBO(91, 83, 102, 1),
  ),
  "dragon": PokemonTypeData(
    assetPath: "assets/pokemon_icons/dragon.png",
    color: Color.fromRGBO(0, 112, 202, 1),
  ),
  "electric": PokemonTypeData(
    assetPath: "assets/pokemon_icons/electric.png",
    color: Color.fromRGBO(251, 210, 0, 1),
  ),
  "fairy": PokemonTypeData(
    assetPath: "assets/pokemon_icons/fairy.png",
    color: Color.fromRGBO(251, 138, 236, 1),
  ),
  "fighting": PokemonTypeData(
    assetPath: "assets/pokemon_icons/fighting.png",
    color: Color.fromRGBO(225, 44, 106, 1),
  ),
  "fire": PokemonTypeData(
    assetPath: "assets/pokemon_icons/fire.png",
    color: Color.fromRGBO(255, 159, 76, 1),
  ),
  "flying": PokemonTypeData(
    assetPath: "assets/pokemon_icons/flying.png",
    color: Color.fromRGBO(138, 172, 228, 1),
  ),
  "ghost": PokemonTypeData(
    assetPath: "assets/pokemon_icons/ghost.png",
    color: Color.fromRGBO(75, 106, 179, 1),
  ),
  "grass": PokemonTypeData(
    assetPath: "assets/pokemon_icons/grass.png",
    color: Color.fromRGBO(53, 192, 74, 1),
  ),
  "ground": PokemonTypeData(
    assetPath: "assets/pokemon_icons/ground.png",
    color: Color.fromRGBO(233, 115, 51, 1),
  ),
  "ice": PokemonTypeData(
    assetPath: "assets/pokemon_icons/ice.png",
    color: Color.fromRGBO(75, 210, 193, 1),
  ),
  "normal": PokemonTypeData(
    assetPath: "assets/pokemon_icons/normal.png",
    color: Color.fromRGBO(146, 155, 163, 1),
  ),
  "poison": PokemonTypeData(
    assetPath: "assets/pokemon_icons/poison.png",
    color: Color.fromRGBO(182, 103, 207, 1),
  ),
  "psychic": PokemonTypeData(
    assetPath: "assets/pokemon_icons/psychic.png",
    color: Color.fromRGBO(255, 102, 118, 1),
  ),
  "rock": PokemonTypeData(
    assetPath: "assets/pokemon_icons/rock.png",
    color: Color.fromRGBO(201, 183, 135, 1),
  ),
  "steel": PokemonTypeData(
    assetPath: "assets/pokemon_icons/steel.png",
    color: Color.fromRGBO(89, 143, 163, 1),
  ),
  "water": PokemonTypeData(
    assetPath: "assets/pokemon_icons/water.png",
    color: Color.fromRGBO(51, 147, 221, 1),
  ),
};
