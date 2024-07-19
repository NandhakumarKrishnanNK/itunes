import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/model/itunes_grouped_model.dart';
import 'package:itunes/src/model/itunes_model.dart';
import 'package:itunes/src/providers/itunes_provider.dart';
import 'package:itunes/src/services/api_service.dart';
import 'package:mockito/mockito.dart';

// Mock class for ApiService
class MockApiService extends Mock implements ApiService {}

void main() {
  late MockApiService mockApiService;
  late ProviderContainer container;
  setUp(() {
    mockApiService = MockApiService();
    container = ProviderContainer(overrides: [
      iTunesProvider(const ITuneParameter(term: 'nolan', entity: 'song'))
          .overrideWith((val) {
        return mockApiService
            .getiTunesData(artist: 'nolan', entity: 'song')
            .then((val) =>
                [ITunesGroupedModel(title: 'song', data: val.results ?? [])]);
      }),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  test('Fetch data', () async {
    // Arrange
    final viewModel = container
        .read(iTunesProvider(ITuneParameter(term: 'nolan', entity: 'song')));
    final data = ITunesGroupedModel(title: 'song', data: [
      Results(trackName: 'trackName', kind: 'kind', artistName: 'artistName')
    ]);
    when(mockApiService.getiTunesData(artist: 'nolan', entity: 'song').then(
        (val) => [ITunesGroupedModel(title: 'song', data: val.results ?? [])]));

    // Act
    await viewModel.asData;

    // Assert
    expect(viewModel, [data]);
  });

  test('fetch data handles errors gracefully', () async {
    // Arrange
    final viewModel = container
        .read(iTunesProvider(ITuneParameter(term: 'nolan', entity: 'song')));
    when(mockApiService.getiTunesData().then((val) => [
          ITunesGroupedModel(title: 'song', data: val.results ?? [])
        ])).thenThrow(Exception('Failed to load songs'));

    // Act
    await viewModel.asData;

    // Assert
    expect(
        container.read(
            iTunesProvider(ITuneParameter(term: 'nolan', entity: 'song'))),
        []);
  });
}
