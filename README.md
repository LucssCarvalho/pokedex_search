
# Pokedex Search

Package to introduce all 151 pokemons of the first generation.

![image](https://user-images.githubusercontent.com/49245496/124057557-0e505b80-d9fe-11eb-9542-cbbca0e6ae7f.png)

## How To Use

Import the following package in your dart file

```dart
import 'package:pokedex_search/pokedex_search.dart';
```

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
          future: PokedexSearch.getListPokemons(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? ''
                : ListView.builder(
                    itemCount: snapshot.data.pokemon.length,
                    itemBuilder: (_, i) {
                      var pokemon = snapshot.data.pokemon[i];
                      return ListTile(
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

```
## Methods

```dart
FutureBuilder<PokedexSearch> listPokemons = PokedexSearch.getListPokemons();
Color colorbyType = ConstColors.getColorType(listPokemons.pokemon[150].type);
```
