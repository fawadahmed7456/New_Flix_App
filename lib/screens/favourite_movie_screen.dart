import 'package:flutter/material.dart';
import 'package:new_flix_2/models/movie_model_class.dart';

import '../consts/api_consts.dart';

class FavoriteMoviesWidget extends StatelessWidget {
  final List<Movie> favoriteMovies;

  const FavoriteMoviesWidget({Key? key, required this.favoriteMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: favoriteMovies.isEmpty
          ? const Center(
              child: Text('No favorite movies yet.'),
            )
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                Movie movie = favoriteMovies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsScreen(movie: movie),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Movie Poster
                          Container(
                            width: 80.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${Constants.imageRootPath}${movie.posterPath}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Movie Details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Movie Title
                                  Text(
                                    movie.title,
                                    style:const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  // Release Date
                                  Text('Release Date: ${movie.releaseDate}'),
                                  const SizedBox(height: 4.0),
                                  // Vote Average
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        movie.voteAverage.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Favorite Icon
                          IconButton(
                            icon:const  Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your Movie Details screen here
    // You can use the provided movie information
    // to display details about the selected movie
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: Text('Movie Details Screen for ${movie.title}'),
      ),
    );
  }
}
