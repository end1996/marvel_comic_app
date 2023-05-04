import 'package:flutter/material.dart';
import 'package:marvel_comic_app/src/pages/comic_detail.dart';
import 'package:marvel_comic_app/src/pages/home_page.dart';
import 'package:marvel_comic_app/src/pages/prueba.dart';
import 'package:marvel_comic_app/src/pages/prueba3.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomePage(),
        'detail':(context) => const ComicDetailPage(),
        'prueba':(context) => const Prueba(),
      },
    );
  }
}