import 'package:flutter/material.dart';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/model/all_pokemon_model.dart';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/model/pokemon_model.dart';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/provider/pokedex_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {

  List<Result> pokemonList = List();
  List<Type> pokeTypeList = List();
  int index = 0;

  @override
  void initState() {
    super.initState();

    PokedexProvider().getAllPokemons().then((pokemonsFromServer) {
      setState(() {
        pokemonList = pokemonsFromServer;
      });
    });

    PokedexProvider().loadPokemonType(pokemonList[index].url.substring(34, pokemonList[index].url.length -1) ).then((pokeTypeFromServer) {
      setState(() {
        pokeTypeList = pokeTypeFromServer;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            height: 30,
            width: 30,
            child: GestureDetector(
              child: SvgPicture.asset("assets/images/back_black.svg"),
              onTap: () => Navigator.of(context).pop(),  
            )
          ),
          Positioned(
            top: -60.0,
            right: -90.0,
            child: Image.asset("assets/images/pokeball.png",
              width: 250,
              height: 250,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80,),
              Flexible(child: _tittleAndGrid())
            ],
          )
        ]
      ),
    );
  }

  Widget _tittleAndGrid() {
    return Column(
      children: [
        Container(height: 40.0,),
        Container(
          width: 324.0,
          child: Text("Pokedex",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "CircularStd-Black",
              color: Color(0xFF303943),
              fontSize: 30.0
            ),
          ),
        ),
        Flexible(child: pokemonGrid())
      ],
    );
  }

  Widget pokemonGrid() {
    if (pokemonList.isNotEmpty) {
      return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 20.0,
          crossAxisCount: 2
        ),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return pokemonCard(index);
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget pokemonCard(index) {
    return GestureDetector(
      child: Container(
        height: 70,
        width: 190,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.indigoAccent,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -4.0,
              right: -3.0,
              child: Image.asset("assets/images/pokeball.png",
                height: 70,
                width:  70,
                color: Colors.white.withOpacity(0.2)
              )
            ),
            Positioned(
              bottom: 5.0,
              right: 5.0,
              child: Image.network("https://pokeres.bastionbot.org/images/pokemon/" + pokemonList[index].url.substring(34, pokemonList[index].url.length -1) + ".png",
                height: 70,
                width:  70,
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Text(pokemonList[index].name[0].toUpperCase() + pokemonList[index].name.substring(1), 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "CircularStd-Bold",
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Text(pokeTypeList[index].type.name, 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "CircularStd-Bold",
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

}