import 'package:flutter/material.dart';
import 'package:pokedex_search/pokedex_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Example App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<PokedexSearch>(
          //method get future pokemon list
          future: PokedexSearch.getListPokemons(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? ''
                : ListView.builder(
                    itemCount: snapshot.data.pokemon.length,
                    itemBuilder: (_, i) {
                      var pokemon = snapshot.data.pokemon[i];
                      return ListTile(
                        // method get color by pokemon type
                        tileColor: ConstColors.getColorType('${pokemon.type}'),
                        title: Text('${pokemon.name}'),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
