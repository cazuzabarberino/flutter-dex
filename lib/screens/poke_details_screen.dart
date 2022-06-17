import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/captalize.dart';
import 'package:pokedex/widgets/pokemon_card_title.dart';
import 'package:pokedex/widgets/pokemon_type_row.dart';

class PokemonDetailsScreen extends StatelessWidget {
  static const String routeName = "/pokemon-details";

  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: ListView(
        children: [
          ClipPath(
            clipper: ArcClipper(),
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 48,
                top: 16,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: pokemon.boxColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "${pokemon.id}-id",
                    child: PokemonCardTitle(text: "#${pokemon.id}"),
                  ),
                  Hero(
                    tag: "${pokemon.id}-title",
                    child: PokemonCardTitle(text: pokemon.name.captalize()),
                  ),
                  Hero(
                    tag: "${pokemon.id}-types",
                    child: PokemonTypeRow(
                      types: pokemon.types,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "${pokemon.id}-image",
                      child: Image.network(
                        pokemon.imageUrl,
                        height: 256,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double arcHeight = size.height > 48 ? 48 : size.height;
    path
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - arcHeight)
      ..quadraticBezierTo(
          size.width / 2, size.height, 0, size.height - arcHeight)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
