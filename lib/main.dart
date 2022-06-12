import 'package:flutter/material.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/screens/poke_details_screen.dart';
import 'package:pokedex/services/poke_api_service.dart';

void main() async {
  await pokeApiService.initService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        PokemonDetailsScreen.routeName: (context) =>
            const PokemonDetailsScreen()
      },
    );
  }
}
