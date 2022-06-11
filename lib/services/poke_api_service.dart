import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

Future<Pokemon?> getPokemonById(int id) async {
  final response =
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id"));
  final json = jsonDecode(response.body);
  final pokemon = Pokemon.fromJson(json);
  return pokemon;
}
