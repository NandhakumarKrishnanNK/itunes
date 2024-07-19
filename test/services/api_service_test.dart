import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:itunes/src/app/http/api_repository.dart';
import 'package:itunes/src/app/http/http_urls.dart';
import 'package:itunes/src/model/itunes_model.dart';
import 'package:itunes/src/services/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiService', () {
    test('Fetch ITunes data using http call completes successfully', () async {
      Future<Response> _mockSuccessRequest(Request request) async {
        if (request.url.toString().startsWith(
            'https://itunes.apple.com/search?term=null&entity=movieArtist')) {
          return Response(
              '{ "resultCount":5, "results": [ {"wrapperType":"artist", "artistType":"Artist", "artistName":"Prodigy", "artistLinkUrl":"https://music.apple.com/us/artist/prodigy/150699546?uo=4", "artistId":150699546, "primaryGenreName":"Hip-Hop/Rap", "primaryGenreId":18}, {"wrapperType":"artist", "artistType":"Movie Artist", "artistName":"Gary Null", "artistLinkUrl":"https://books.apple.com/us/artist/gary-null/410654804?uo=4", "artistId":410654804, "primaryGenreName":"Health & Fitness", "primaryGenreId":10069}, {"wrapperType":"artist", "artistType":"Movie Artist", "artistName":"null", "artistLinkUrl":"https://itunes.apple.com/us/artist/null/1541766437?uo=4", "artistId":1541766437}, {"wrapperType":"artist", "artistType":"Artist", "artistName":"Matt Null", "artistLinkUrl":"https://music.apple.com/us/artist/matt-null/1492319815?uo=4", "artistId":1492319815, "primaryGenreName":"Downtempo", "primaryGenreId":1057}, {"wrapperType":"artist", "artistType":"Movie Artist", "artistName":"Vance Null", "artistLinkUrl":"https://itunes.apple.com/us/artist/vance-null/1587057546?uo=4", "artistId":1587057546, "primaryGenreName":"Drama", "primaryGenreId":4406}] }',
              200);
        }
        return throw Exception('failed');
      }

      final client = await MockClient(_mockSuccessRequest)
          .get(Uri.parse(
              'https://itunes.apple.com/search?term=null&entity=movieArtist'))
          .then((val) => val);

      final apiService = await ApiService()
          .getiTunesData(artist: 'null', entity: 'movieArtist');

      expect(apiService.resultCount,
          ITunesModel.fromJson(jsonDecode(client.body)).resultCount);
    });

    test(
        'ITunes when fetching the data throws an exception if the http call completes with an error',
        () async {
      Future<Response> _mockFailiureRequest(Request request) async {
        if (request.url.toString().startsWith(
            'https://itunes.apple.com/search?term=nolan&entity=ebookss')) {
          return Response(
              '{ "errorMessage":"Invalid value(s) for key(s): [resultEntity]", "queryParameters":{"output":"json", "callback":"A javascript function to handle your search results", "country":"ISO-2A country code", "limit":"The number of search results to return", "term":"A search string", "lang":"ISO-2A language code"} }',
              400);
        }
        return throw Exception('failed');
      }

      final client = MockClient(_mockFailiureRequest)
          .get(Uri.parse(
              'https://itunes.apple.com/search?term=nolan&entity=ebookss'))
          .then((onValue) => onValue.statusCode);
      // final apiService = ApiService();
      var apiResult = await HttpRepository.apiRequest(HttpRequestType.get,
              HttpUrls.searchITunes(artist: 'nolan', entity: 'ebookss'))
          .then((response) {
        return response.statusCode;
      });

      expect(apiResult, await client.then((onValue) => onValue));
    });
  });
}
