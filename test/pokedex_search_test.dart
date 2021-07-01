import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_search/pokedex_search.dart';

Future<void> main() async {
  final pokes = await PokedexSearch.getListPokemons();

  test('a list of 151 Pokemons', () {
    expect(pokes.pokemon.length, 151);
  });
}
