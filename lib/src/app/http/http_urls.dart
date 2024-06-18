class HttpUrls {
  static const String baseUrl = 'https://itunes.apple.com';
  static String searchITunes({String? artist, String? entity}) {
    if (entity != '') {
      return '$baseUrl/search?term=$artist&entity=$entity';
    } else {
      return '$baseUrl/search?term=$artist';
    }
  }
}
