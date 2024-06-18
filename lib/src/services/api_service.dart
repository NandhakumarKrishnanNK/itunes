import 'dart:convert';

import 'package:itunes/src/app/http/api_repository.dart';
import 'package:itunes/src/app/http/http_urls.dart';

import '../model/itunes_model.dart';

class ApiService {
  Future<ITunesModel> getiTunesData({String? artist, String? entity}) async {
    ITunesModel itunesData = ITunesModel();
    await HttpRepository.apiRequest(HttpRequestType.get,
            HttpUrls.searchITunes(artist: artist, entity: entity))
        .then((response) {
      itunesData = ITunesModel.fromJson(jsonDecode(response.data));
    });
    return itunesData;
  }
}
