class HttpUrls {
  static const String baseUrl = 'https://itunes.apple.com';
  static String searchITunes({String? artist, required String entity}) =>
      '$baseUrl/search?term=$artist&entity=$entity';
}
