import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_search/pokedex_search.dart';

Future<void> main() async {
  final pokedexSearch = await PokedexSearch.getListPokemons();

  test('a list of 151 Pokemons', () {
    expect(pokedexSearch.pokemon.length, 151);
  });
}
