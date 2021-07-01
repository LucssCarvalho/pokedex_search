
# Pokedex Search

Package to introduce all 151 pokemons of the first generation.

![image](https://user-images.githubusercontent.com/49245496/124057557-0e505b80-d9fe-11eb-9542-cbbca0e6ae7f.png)


## Usage

```dart
import 'package:flutter/material.dart';
import 'package:pokedex_search/pokedex_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                return snapshot.data == null
                    ? Container(),
                    : ListView.builder(
                        itemCount: snapshot.data.pokemon.length,
                        itemBuilder: (_, i) {
                          return ListTile(
                            title: Text('${snapshot.data.pokemon[i].name}'),
                          );
                        });
              })),
    );
  }
}
```

