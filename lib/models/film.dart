
import 'dart:ffi';

class Film {
  final String id;
  final String localized_name;
  final String name;
  final String year;
  final String rating;
  final String image_url;
  final String descripton;
  final List<dynamic> genres;

  const Film({
      required this.id,
      required this.localized_name,
      required this.name,
      required this.year,
      required this.rating,
      required this.image_url,
      required this.descripton,
      required this.genres
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id:  json['id'].toString() == 'null' ? 'No data' : json['id'].toString(),
      localized_name: json['localized_name'].toString() ?? 'No data',
      name: json['name'].toString() ?? 'No data',
      year: json['year'].toString() ?? 'No data',
      rating: json['rating'].toString() == 'null' ? '0.0' : json['rating'].toString(),
      image_url: json['image_url'].toString() ?? 'No data',
      descripton: json['descripton'].toString() ?? 'No data',
      genres: json['genres'] ?? ['No data'],
    );
  }


}
