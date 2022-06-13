import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/captalize.dart';
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
          Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: "${pokemon.name}-teste",
                  child: ClipPath(
                    clipper: ArcClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: pokemon.boxColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 48,
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "${pokemon.name}-id",
                      child: Text(
                        "#${pokemon.id}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Hero(
                      tag: "${pokemon.name}-title",
                      child: Text(
                        pokemon.name.captalize(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Hero(
                      tag: "${pokemon.name}-types",
                      child: PokemonTypeRow(
                        types: pokemon.types,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "${pokemon.name}-image",
                        child: Image.network(
                          pokemon.imageUrl,
                          height: 256,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
