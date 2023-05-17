import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_film_view/models/film.dart';
import 'package:flutter_film_view/pages/films_list.dart';

Future<List<Film>> fetchFilms(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json'));

  return compute(parseFilms,  utf8.decode(response.bodyBytes));
}

List<Film> parseFilms(String responseBody) {
final parsed = (jsonDecode(responseBody)['films']).cast<Map<String, dynamic>>();

  return parsed.map<Film>((json) => Film.fromJson(json)).toList();
}

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список фильмов'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Film>> (
          future: fetchFilms(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
                // child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return FilmsList(films: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}
