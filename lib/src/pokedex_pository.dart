import 'package:dio/dio.dart';
import 'dart:convert';
import 'model.dart';

class PokedexRepository {
  static Future<PokedexSearch> search() async {
    var response = await Dio().get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    return PokedexSearch.fromJson(json.decode(response.data));
  }
}
