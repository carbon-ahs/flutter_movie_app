import 'package:flutter/material.dart';

import 'model/movie.dart';
import 'movie_details.dart';

class HomePage extends StatelessWidget {
  final List<Movie> movies = Movie.getMovies();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _movieCard(context, movies[index]);
        },
      ),
    );
  }
}

Widget _movieCard(BuildContext context, Movie movie) {
  return InkWell(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Card(
        color: Colors.black45,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.title),
                  Text("Rating: ${movie.imdbRating} / 10"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Released: ${movie.released}"),
                  Text("Runtime: ${movie.runtime}"),
                  Text(movie.rated),
                ],
              )

              // ListTile(
              //   leading: CircleAvatar(
              //     child: Container(
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: NetworkImage(movie.images[0]),
              //           fit: BoxFit.cover,
              //         ),
              //         borderRadius: const BorderRadius.all(Radius.circular(13.9)),
              //       ),
              //     ),
              //   ),
              //   title: Text(movie.title),
              //   subtitle: Text(movie.director),
              //   trailing: IconButton(
              //     onPressed: () {
              //       debugPrint('Delete');
              //     },
              //     icon: const Icon(Icons.delete),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      debugPrint('Tapped: ${movie.title}');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MovieDetails(movie: movie)));
    },
  );
}
