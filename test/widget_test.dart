// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itunes/main.dart';

import 'package:itunes/src/app/utils/string_resources.dart';
import 'package:itunes/src/model/itunes_model.dart';
import 'package:itunes/src/view/detail_screen.dart';
import 'package:itunes/src/view/home_screen.dart';
import 'package:itunes/src/view/itunes_screen.dart';
import 'package:itunes/src/view/media_screen.dart';

void main() {
  testWidgets('iTunes all widgets testing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HomeScreen(),
          ),
        ),
      ),
    );
    expect(find.text('Submit'), findsOneWidget);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MediaScreen(),
          ),
        ),
      ),
    );
    expect(find.text(StringResource.media), findsOneWidget);

    // await tester.pumpWidget(ProviderScope(
    //   child: Scaffold(
    //     body: ITunesScreen(
    //       term: 'nolan',
    //       entity: 'song',
    //     ),
    //   ),
    // ));
    // expect(find.text('Error: Something went wrong.'), findsOneWidget);

    await tester.pumpWidget(ProviderScope(
      child: DetailScreen(
        data: Results.fromJson({
          "wrapperType": "track",
          "kind": "feature-movie",
          "collectionId": 1698152339,
          "trackId": 271469254,
          "artistName": "Christopher Nolan",
          "collectionName": "Christopher Nolan 6-Film Bundle",
          "trackName": "Batman Begins",
          "collectionCensoredName": "Christopher Nolan 6-Film Bundle",
          "trackCensoredName": "Batman Begins",
          "collectionArtistId": 199257486,
          "collectionArtistViewUrl":
              "https://itunes.apple.com/us/artist/warner-bros-entertainment-inc/199257486?uo=4",
          "collectionViewUrl":
              "https://itunes.apple.com/us/movie/batman-begins/id271469254?uo=4",
          "trackViewUrl":
              "https://itunes.apple.com/us/movie/batman-begins/id271469254?uo=4",
          "previewUrl":
              "https://video-ssl.itunes.apple.com/itunes-assets/Video128/v4/1d/4a/df/1d4adf5e-7a81-b4d6-a25f-a4d1777c48ed/mzvf_8889941206725935092.640x362.h264lc.U.p.m4v",
          "artworkUrl30":
              "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/78/49/41/784941ac-43c4-e3ee-204c-6dd87de283e6/contsched.deqkhkxo.lsr/30x30bb.jpg",
          "artworkUrl60":
              "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/78/49/41/784941ac-43c4-e3ee-204c-6dd87de283e6/contsched.deqkhkxo.lsr/60x60bb.jpg",
          "artworkUrl100":
              "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/78/49/41/784941ac-43c4-e3ee-204c-6dd87de283e6/contsched.deqkhkxo.lsr/100x100bb.jpg",
          "collectionPrice": 14.99,
          "trackPrice": 14.99,
          "trackRentalPrice": 3.99,
          "collectionHdPrice": 14.99,
          "trackHdPrice": 14.99,
          "trackHdRentalPrice": 3.99,
          "releaseDate": "2005-06-15T07:00:00Z",
          "collectionExplicitness": "notExplicit",
          "trackExplicitness": "notExplicit",
          "trackCount": 6,
          "trackNumber": 1,
          "trackTimeMillis": 8401280,
          "country": "USA",
          "currency": "USD",
          "primaryGenreName": "Action & Adventure",
          "contentAdvisoryRating": "PG-13",
          "longDescription":
              "As a young boy, Bruce Wayne watched in horror as his millionaire parents were slain in front of him--a trauma that leads him to become obsessed with revenge. But the opportunity to avenge his parents' deaths is cruelly taken away from him by fate. Fleeing to the East, where he seeks counsel with the dangerous but honorable ninja cult leader known as Ra's Al-Ghul, Bruce returns to his now decaying Gotham City, which is overrun by organized crime and other dangerous individuals manipulating the system. Meanwhile, Bruce is slowly being swindled out of Wayne Industries, the company he inherited. The discovery of a cave under his mansion, along with a prototype armored suit, leads him to assume a new persona, one which will strike fear into the hearts of men who do wrong; he becomes Batman!!!",
          "hasITunesExtras": true
        }),
      ),
    ));

    expect(find.text(StringResource.preview), findsOneWidget);

    // expect(find.(StringResource.itunes), findsOneWidget);

    // // for tap media type button
    // await tester.tap(find.text(StringResource.selectMediaType));
    // await tester.pump();

    // await tester.tap(find.text(StringResource.submit));
    // await tester.pump();
  });
}
