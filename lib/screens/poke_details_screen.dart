import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

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
              padding: const EdgeInsets.only(bottom: 48),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: pokemon.boxColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Hero(
                tag: pokemon.name,
                child: Image.network(pokemon.imageUrl),
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
