import 'package:flutter/material.dart';

import 'package:flutter_pokedex_j4ck/pages/home_page/ui/widgets/actions_Grid.dart';
import 'package:flutter_pokedex_j4ck/pages/home_page/ui/widgets/search_Pokemon.dart';
import 'package:flutter_pokedex_j4ck/pages/home_page/ui/widgets/what_pokemon_tittle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _whatPokemon(context),
            SizedBox(height: 20.0,),
            _credits(context)
          ],
        ),
      ),
    );
  }

  Widget _whatPokemon(context) {
    return Container(
      height: 640.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0)
        )
      ),
      child: Column(
        children: [
          WhatPokemonTittle().whatPokemonText(),
          SizedBox(height: 40.0,),
          SearchPokemon().searchPokemonField(),
          Expanded(child: ActionsGrid().bottonsGrid(context))
        ],
      ),
    );
  }

  Widget _credits(context) {
    return Text("Credits",
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF6C79DB),
        fontFamily: "CircularStd-Medium",
      ),
    );
  }

}