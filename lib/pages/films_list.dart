import 'package:flutter/material.dart';
import 'package:flutter_film_view/models/film.dart';

class FilmsList extends StatelessWidget {
  const FilmsList({super.key, required this.films});

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (BuildContext context, int index) {
        // Image image = Image(
        //   image: NetworkImage(
        //     films[index].image_url,
        //   ),
        //   height: 128,
        //   width: 128,
        //   errorBuilder:
        //       (BuildContext context, Object exception, StackTrace? stackTrace) {
        //     return const Image(
        //       image: AssetImage('assets/raiden.jpg'),
        //       height: 128,
        //       width: 128,
        //     );
        //   },
        // );

        return Padding(
            padding: EdgeInsets.all(2.0),
            child: Card(
              key: Key(films[index].id.toString()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Image(
                      image: NetworkImage(
                        films[index].image_url,
                      ),
                      height: 128,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Image(
                          image: AssetImage('assets/raiden.jpg'),
                          height: 128,
                        );
                      },
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Название: ${films[index].name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
                        child: Text('Рейтинг: ${films[index].rating}'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 4.0),
                        child: Text('Год: ${films[index].year}'),
                      ),
                    ],
                  ))
                ],
              ),
            )
        );
      },
    );
  }
}
