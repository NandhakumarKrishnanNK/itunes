import 'package:flutter_test/flutter_test.dart';
import 'package:itunes/src/model/itunes_model.dart';

void main() {
  test('Test the ITunes model', () {
    //https://itunes.apple.com/search?term=nolan&entity=song
    final json = {
      "resultCount": 50,
      "results": [
        {
          "wrapperType": "track",
          "kind": "song",
          "artistId": 186406961,
          "collectionId": 843666402,
          "trackId": 843666410,
          "artistName": "Ben Frost",
          "collectionName": "A U R O R A",
          "trackName": "Nolan",
          "collectionCensoredName": "A U R O R A",
          "trackCensoredName": "Nolan",
          "artistViewUrl":
              "https://music.apple.com/us/artist/ben-frost/186406961?uo=4",
          "collectionViewUrl":
              "https://music.apple.com/us/album/nolan/843666402?i=843666410&uo=4",
          "trackViewUrl":
              "https://music.apple.com/us/album/nolan/843666402?i=843666410&uo=4",
          "previewUrl":
              "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/41/fc/dc/41fcdcd3-6360-ea2a-e3f1-28e25b9a12da/mzaf_10177308312130238318.plus.aac.p.m4a",
          "artworkUrl30":
              "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/20/f5/cc/20f5cc47-6c42-116b-a258-fa47460ab095/724596959657.jpg/30x30bb.jpg",
          "artworkUrl60":
              "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/20/f5/cc/20f5cc47-6c42-116b-a258-fa47460ab095/724596959657.jpg/60x60bb.jpg",
          "artworkUrl100":
              "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/20/f5/cc/20f5cc47-6c42-116b-a258-fa47460ab095/724596959657.jpg/100x100bb.jpg",
          "collectionPrice": 9.99,
          "trackPrice": 1.29,
          "releaseDate": "2014-05-21T12:00:00Z",
          "collectionExplicitness": "notExplicit",
          "trackExplicitness": "notExplicit",
          "discCount": 1,
          "discNumber": 1,
          "trackCount": 9,
          "trackNumber": 2,
          "trackTimeMillis": 417587,
          "country": "USA",
          "currency": "USD",
          "primaryGenreName": "Electronic",
          "isStreamable": true
        }
      ]
    };

    final response = ITunesModel.fromJson(json);

    expect(response.resultCount, 50);
    expect(response.results![0].artistName, 'Ben Frost');
    expect(response.results![0].artworkUrl100,
        'https://is1-ssl.mzstatic.com/image/thumb/Music/v4/20/f5/cc/20f5cc47-6c42-116b-a258-fa47460ab095/724596959657.jpg/100x100bb.jpg');
  });
}
