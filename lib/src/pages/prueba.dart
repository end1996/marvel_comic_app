// import 'package:flutter/material.dart';
// import 'dart:convert';

// import '../../providers/marvel_api.dart';

// class MarvelCharacters extends StatefulWidget {
//   const MarvelCharacters({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MarvelCharactersState createState() => _MarvelCharactersState();
// }

// class _MarvelCharactersState extends State<MarvelCharacters> {
//   List<dynamic> _characters = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchCharacters();
//   }

//   Future<void> _fetchCharacters() async {
//     final response = await MarvelApi.getCharacters();
//     final data = jsonDecode(response.body)['data']['results'];
//     setState(() {
//       _characters = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Personajes de Marvel'),
//       ),
//       body: ListView.builder(
//         itemCount: _characters.length,
//         itemBuilder: (BuildContext context, int index) {
//           final character = _characters[index];
//           return ListTile(
//             leading: Image.network(
//               '${character['thumbnail']['path']}.${character['thumbnail']['extension']}',
//               width: 50,
//               height: 50,
//             ),
//             title: Text(character['name']),
//           );
//         },
//       ),
//     );
//   }
// }
