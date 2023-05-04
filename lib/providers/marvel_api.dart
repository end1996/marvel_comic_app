import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_comic_app/src/models/comic_model2.dart';

class MarvelApi {
  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String _apiKey = '41defd33e930b5c61350563064651f7d';
  static const String _hash = 'a29d47a88ff63d3205c11804f2f97df8&ts=1';
  static const String _startYear = '2010';
  
  //  late Future <List<Comic>> _listadoComics;
  // late Future <List<Comic>> _listadoComicsUpdated;

  Future<List<Comic>> _getComics() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/comics?apikey=$_apiKey&hash=$_hash&startYear=$_startYear'));

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

  Future<List<Comic>> _getComicsLastUpdated() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/comics?apikey=$_apiKey&hash=$_hash&startYear=2023'));

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
}







//17eadb0c21fdd448734ea22fc0f75d13cd5c4a4cc41defd33e930b5c61350563064651f7d

//MD5 Hash
//a29d47a88ff63d3205c11804f2f97df8
