import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/comic_model2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String _apiKey = '41defd33e930b5c61350563064651f7d';
  static const String _hash = 'a29d47a88ff63d3205c11804f2f97df8&ts=1';
  static const String _startYear = '2022';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future <List<Comic>> _listadoComics;
  late Future <List<Comic>> _listadoComicsUpdated;

  Future<List<Comic>> _getComics() async {
    final response = await http.get(
      Uri.parse('${HomePage._baseUrl}/comics?apikey=${HomePage._apiKey}&hash=${HomePage._hash}&startYear=${HomePage._startYear}'));

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
      Uri.parse('${HomePage._baseUrl}/comics?apikey=${HomePage._apiKey}&hash=${HomePage._hash}&startYear=2023'));

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
    _listadoComicsUpdated = _getComicsLastUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Column(
            children: [
              _userRow(),
              const SizedBox(
                height: 10.0,
              ),
              _title('Best Selling Comics'),
              const SizedBox(
                height: 10.0,
              ),
              _createBestSelling(context),
              _title('Last Updated'),
              _createLastUpdated(context),
            ],
          )
        ],
      ),
    ));
  }

  Widget _userRow() {
    return Row(
      children: [
        Row(
          children: const [
            CircleAvatar(
              radius: 30.0,
              child: Image(
                image: AssetImage('assets/batman_avatar.png'),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Username',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
    );
  }

  Widget _title(String titulo) {
    return Row(
      children: [
        Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        const Expanded(child: SizedBox()),
        TextButton(
            onPressed: () {},
            child: const Text(
              'See all',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }

  Widget _createBestSelling(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('detail'),
      child: SizedBox(
        height: 250.0,
        child: FutureBuilder(
          future: _listadoComics,
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
           if(snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: _bestSellingCards(snapshot.data),
            );
          } else if (snapshot.hasError) {
            print('Error');
          } return const Center(child: CircularProgressIndicator());
        },
        ),
      ),
    );
  }

  List<Widget> _bestSellingCards(List<Comic> data) {
    const estiloTexto = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
    List<Widget> lista = [];
    for (var comic in data) {
      lista.add(
        Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: SizedBox(
                  height: 200.0,
                  width: 150.0,
                  child: FadeInImage(
                    image: NetworkImage(comic.thumbnailUrl.toString()),
                    placeholder: const AssetImage('assets/ironman.jpg'),
                    fit: BoxFit.fill,
                    )
                ),
              ),
              SizedBox(
                width: 150.0,
                child: Text(
                  comic.title.toString(),
                  style: estiloTexto,overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ],
    )
      );
    } return lista;
  }

  Widget _createLastUpdated(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('detail'),
      child: SizedBox(
        height: double.maxFinite,
        child: FutureBuilder(
          future: _listadoComicsUpdated,
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView(
                children: 
                  _lastUpdatedCards(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print('Error');
            } return Center(
              child: CircularProgressIndicator(
                
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _lastUpdatedCards(List<Comic> data) {
    const estiloTexto = TextStyle(fontWeight: FontWeight.w600);
    List<Widget> lista = [];
    for (var comic in data) {
      lista.add(
        Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 150.0,
              width: 120.0,
              child: FadeInImage(
                image: NetworkImage(comic.thumbnailUrl.toString()),
                      placeholder: const AssetImage('assets/ironman.jpg'),
                      fit: BoxFit.fill,
                ),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comic.title.toString(),
                style: estiloTexto,
              ),
              // const SizedBox(
              //   height: 15.0,
              // ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text('4.5')
                ],
              ),
              Text(
                'ON SALE: ${comic.date}',
                style: const TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'U.S. Price: ${comic.price}'.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_right_alt_sharp))
                ],
              )
            ],
          ),
        )
      ],
    )
      );
      
    } return lista;
  }
}
