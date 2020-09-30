import 'package:flutter/material.dart';

import 'package:flutter_pokedex_j4ck/pages/home_page/ui/widgets/button_Grid.dart';

class ActionsGrid {
  Widget bottonsGrid(context) {
    return GridView.count(
      childAspectRatio: 2.2,
      padding: EdgeInsets.all(30),
      crossAxisCount: 2,
      crossAxisSpacing: 30.0,
      mainAxisSpacing: 30.0,
      children: [
        BotonGrid().botton(context, 'pokedex_page',Color(0xFF4FC1A6), Color(0xFF4FC1A6).withOpacity(0.5), "Pokedex"),
        BotonGrid().botton(context, 'pokedex_page',Color(0xFFF7786B), Color(0xFFF7786B).withOpacity(0.5), "Moves"),
        BotonGrid().botton(context, 'pokedex_page',Color(0xFF58ABF6), Color(0xFF58ABF6).withOpacity(0.5), "Abilities"),
        BotonGrid().botton(context, 'pokedex_page',Color(0xFFFFCE4B), Color(0xFFFFCE4B).withOpacity(0.5), "Items"),
        BotonGrid().botton(context, 'pokedex_page',Color(0xFF7C538C), Color(0xFF7C538C).withOpacity(0.5), "Locations"),
        BotonGrid().botton(context, 'pokedex_page',Color(0xFFB1736C), Color(0xFFB1736C).withOpacity(0.5), "Type Charts"),
      ],
    );
  }
}