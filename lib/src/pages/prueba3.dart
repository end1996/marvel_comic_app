import 'dart:convert';

import 'package:flutter/material.dart';
// import '../../providers/comic_api.dart';
import 'package:http/http.dart' as http;

import '../models/comic_model2.dart';

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {

  late Future <List<Comic>> _listadoComics;
  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String _apiKey = '41defd33e930b5c61350563064651f7d';
  static const String _hash = 'a29d47a88ff63d3205c11804f2f97df8&ts=1';

  Future<List<Comic>> _getComics() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/comics?apikey=$_apiKey&hash=$_hash'));

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'];
      final results = data['results'];

      List<Comic> comics = [];
      for (var result in results) {
        comics.add(Comic.fromJson(result));
      }
      return comics;
    } else {
      throw Exception('Falló la conexión');
    } 
}

  @override
  void initState() {
    super.initState();
    _listadoComics = _getComics();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _listadoComics,
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return ListView(
              children: _comicList(snapshot.data),
            );
          } else if (snapshot.hasError) {
            print('Error');
            Text('Error');
          } return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<Widget> _comicList(List<Comic> data) {
    List<Widget> lista = [];
    for (var comic in data) {
      lista.add(
        ListTile(
          title: Text(comic.title.toString()),
          subtitle: Text(comic.id.toString()),
          leading: SizedBox(
            height: 250,
            width: 100,
            child: Image.network(comic.thumbnailUrl.toString(),fit: BoxFit.fill,)),
        ),
      );
    }
    return lista;
  }
}