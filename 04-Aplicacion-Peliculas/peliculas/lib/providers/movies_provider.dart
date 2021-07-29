import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '70d73d497bfb4c24ffb0b7988108ee8c';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: Duration( milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;

  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(this._baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': page.toString()});

    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    this.onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    this._popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    this.popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if( movieCast.containsKey(movieId) ) return movieCast[movieId]!;

    print('Pidiendo informacion al servidor - Cast');

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(this._baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);

    final movieSearchResponse = SearchMovieResponse.fromJson( response.body );

    return movieSearchResponse.results;
  }

  void getSuggestionsByQuery(String query){
    debouncer.value = '';
    debouncer.onValue = ( value )async {

      final results = await this.searchMovies( value );

      this._suggestionStreamController.add( results );
      
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value = query;
    });

    Future.delayed(Duration( milliseconds:  301 )).then((_) => timer.cancel());
  }
}
