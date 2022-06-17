import 'package:flutter/material.dart';

class PokemonCardTitle extends StatelessWidget {
  const PokemonCardTitle({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
