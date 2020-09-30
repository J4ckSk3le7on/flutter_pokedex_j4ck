import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SearchPokemon {
  Widget searchPokemonField() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(25)
      ),
      width: 324.0,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 1.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search Pokemon",
            icon: SvgPicture.asset("assets/images/search_black.svg",)
          ),
        ),
      ),
    );
  }
}