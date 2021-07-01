import 'package:flutter/material.dart';
import 'package:pokedex_search/pokedex_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<PokedexSearch>(
              future: PokedexSearch.getListPokemons(),
              builder: (context, snapshot) {
                return Text(snapshot.data == null
                    ? ''
                    : snapshot.data.pokemon[45].name);
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget pokemonTile(Pokemon pokemon) {
  return GestureDetector(
    onTap: () {
      List<Pokemon> nextEvolution = [];
      List<Pokemon> prevEvolution = [];

      if (pokemon.nextEvolution != null) {
        pokemon.nextEvolution.forEach((pokes) {
          nextEvolution.add(firstGen.pokemon
              .firstWhere((element) => pokes.name == element.name));
        });
      }

      if (pokemon.prevEvolution != null) {
        pokemon.prevEvolution.forEach((pokes) {
          prevEvolution.add(firstGen.pokemon
              .firstWhere((element) => pokes.name == element.name));
        });
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PokemonDetail(
              pokemon, nextEvolution, prevEvolution, firstGen.pokemon),
        ),
      );
    },
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon.name.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "#${pokemon.num.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTypes(pokemon),
              getPokemonImage(pokemon),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: ConstColors.getColorType(type: pokemon.type[0]),
          borderRadius: BorderRadius.circular(15)),
    ),
  );
}
