import 'package:flutter/material.dart';

class WhatPokemonTittle {
  Widget whatPokemonText() {
    return Stack(
      children: [
        Positioned(
          top: -60.0,
          right: -90.0,
          child: Image.asset("assets/images/pokeball.png",
            width: 250,
            height: 250,
            color: Colors.grey.withOpacity(0.2),
          )
        ),
        Column(
        children: [
          Container(height: 20.0,),
          Container(
            width: 324.0,
            child: Text("Flutter             Pokedex",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "CircularStd-Black",
                color: Color(0xFF303943),
                fontSize: 40.0
              ),
            ),
          ),
          Container(height: 40.0,),
          Container(
            width: 324.0,
            child: Text("What Pokemon          are you looking for?",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "CircularStd-Bold",
                color: Color(0xFF303943),
                fontSize: 30.0
              ),
            ),
          ),
        ],
      ),
      ],
    );
  }
}