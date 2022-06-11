import 'package:flutter/material.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/services/poke_api_service.dart';

void main() async {
  await pokeApiService.initService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
