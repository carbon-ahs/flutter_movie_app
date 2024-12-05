import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Text(movie.title),
              const Spacer(),
              Text("Rating: ${movie.imdbRating} / 10"),
            ],
          ),
          Row(
            children: [
              Text("Released: ${movie.released}"),
              const Spacer(),
              Text("Runtime: ${movie.runtime}"),
            ],
          ),
          Row(
            children: [
              Text(movie.rated),
              const Spacer(),
              Text(movie.genre),
            ],
          )
        ]),
      ),
    );
  }
}
