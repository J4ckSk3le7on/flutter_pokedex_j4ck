import 'dart:convert';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/model/all_pokemon_model.dart';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokedexProvider {

  final _baseUrl = "https://pokeapi.co/api/v2";

  int offset = 0;

  Future<List<Result>> getAllPokemons() async {

    final String _urlAllPokemons = "$_baseUrl/pokemon/?offset=$offset&limit=20";
    final _resp = await http.get(_urlAllPokemons);
    final _rawJson = json.encode(_resp.body);
    final _rawResp = json.decode(_rawJson);
    final pokemonsRute = AllPokemonModel.fromRawJson(_rawResp);
    List<dynamic> allPokemons = pokemonsRute.results;
    print(_urlAllPokemons);
    return allPokemons.toList();

  }

  Future<List<Result>> loadMorePokemons() async {

    int nextOffset = offset + 20;
    final String _urlAllPokemons = "$_baseUrl/pokemon/?offset=$nextOffset&limit=20";
    final _resp = await http.get(_urlAllPokemons);
    final _rawJson = json.encode(_resp.body);
    final _rawResp = json.decode(_rawJson);
    final pokemonsRute = AllPokemonModel.fromRawJson(_rawResp);
    List<dynamic> allPokemons = pokemonsRute.results;
    return allPokemons.toList();

  }

  Future<List<Type>> loadPokemonType(pokeNumber) async {

    final String _urlPokemon = "$_baseUrl/pokemon/$pokeNumber";
    final _resp = await http.get(_urlPokemon);
    final _rawJson = json.encode(_resp.body);
    final _rawResp = json.decode(_rawJson);
    final pokemonRute = PokemonModel.fromRawJson(_rawResp);
    List<dynamic> pokemonType = pokemonRute.types;
    return pokemonType.toList();

  }


}