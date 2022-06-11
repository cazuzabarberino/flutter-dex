import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

final PokeApiService pokeApiService = PokeApiService();

class PokeApiService {
  bool _loaded = false;
  int _totalPokemonSpecies = 0;
  List<int> _totalSpeciesByGeneration = [];
  List<String> _pokemonSpecieNames = [];
  List<Pokemon?> _pokemonIdCache = [];

  int getTotalPokemonSpecies() => _totalPokemonSpecies;

  Future initService() async {
    if (_loaded) return;
    await Future.wait([
      _initSpecies(),
      _initGeneration(),
      _initPokemonIdCache(),
    ]);
    _loaded = true;
  }

  Future _initPokemonIdCache() async {
    final res = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"));
    final json = jsonDecode(res.body);
    int count = json["count"];
    _pokemonIdCache = List.generate(count, (index) => null);
  }

  Future _initSpecies() async {
    final res = await http.get(Uri.parse(
        "https://pokeapi.co/api/v2/pokemon-species?limit=100000&offset=0"));
    final json = jsonDecode(res.body);
    _totalPokemonSpecies = json["count"];
    _pokemonSpecieNames =
        (json["results"] as List).map((e) => e["name"].toString()).toList();
  }

  Future _initGeneration() async {
    final res =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/generation/"));
    final json = jsonDecode(res.body);
    int count = json["count"];
    _totalSpeciesByGeneration = List.generate(count, (index) => 0);
    final List<Future> futures = [];
    for (int i = 1; i <= count; i++) {
      futures.add(http
          .get(Uri.parse("https://pokeapi.co/api/v2/generation/$i/"))
          .then((value) {
        final json = jsonDecode(value.body);
        _totalSpeciesByGeneration[i - 1] =
            (json["pokemon_species"] as List).length;
      }));
    }
    await Future.wait(futures);
  }

  Future<Pokemon?> getPokemonById(int id) async {
    final pokemonCacheIndex = id - 1;
    final pokemonInCache = _pokemonIdCache[pokemonCacheIndex];
    if (pokemonInCache != null) return pokemonInCache;
    final response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id"));
    final json = jsonDecode(response.body);
    final pokemon = Pokemon.fromJson(json);
    _pokemonIdCache[pokemonCacheIndex] = pokemon;
    return pokemon;
  }
}
