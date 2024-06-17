class ITunesModel {
  int? resultCount;
  List<Results>? results;

  ITunesModel({this.resultCount, this.results});

  ITunesModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCount'] = this.resultCount;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? wrapperType;
  String? kind;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  // double? trackRentalPrice;
  // double? collectionHdPrice;
  // double? trackHdPrice;
  // double? trackHdRentalPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;
  int? artistId;
  String? artistViewUrl;
  int? discCount;
  int? discNumber;
  bool? isStreamable;
  String? collectionType;
  int? amgArtistId;
  String? copyright;
  // List<String>? genres;
  double? price;
  // List<String>? genreIds;
  String? description;
  // List<int>? artistIds;
  int? fileSizeBytes;
  String? formattedPrice;
  double? averageUserRating;
  int? userRatingCount;
  String? feedUrl;
  String? artworkUrl600;

  Results(
      {this.wrapperType,
      this.kind,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.collectionArtistId,
      this.collectionArtistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      // this.trackRentalPrice,
      // this.collectionHdPrice,
      // this.trackHdPrice,
      // this.trackHdRentalPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.contentAdvisoryRating,
      this.shortDescription,
      this.longDescription,
      this.hasITunesExtras,
      this.artistId,
      this.artistViewUrl,
      this.discCount,
      this.discNumber,
      this.isStreamable,
      this.collectionType,
      this.amgArtistId,
      this.copyright,
      // this.genres,
      this.price,
      // this.genreIds,
      this.description,
      // this.artistIds,
      this.fileSizeBytes,
      this.formattedPrice,
      this.averageUserRating,
      this.userRatingCount,
      this.feedUrl,
      this.artworkUrl600});

  Results.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistViewUrl = json['collectionArtistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    // trackRentalPrice = json['trackRentalPrice'];
    // collectionHdPrice = json['collectionHdPrice'];
    // trackHdPrice = json['trackHdPrice'];
    // trackHdRentalPrice = json['trackHdRentalPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    hasITunesExtras = json['hasITunesExtras'];
    artistId = json['artistId'];
    artistViewUrl = json['artistViewUrl'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    isStreamable = json['isStreamable'];
    collectionType = json['collectionType'];
    amgArtistId = json['amgArtistId'];
    copyright = json['copyright'];
    // genres = json['genres'] ?? [];
    price = json['price'];
    // genreIds = json['genreIds'] ?? [];
    description = json['description'];
    // artistIds = json['artistIds'] ?? [];
    fileSizeBytes = json['fileSizeBytes'];
    formattedPrice = json['formattedPrice'];
    averageUserRating = json['averageUserRating'];
    userRatingCount = json['userRatingCount'];
    feedUrl = json['feedUrl'];
    artworkUrl600 = json['artworkUrl600'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wrapperType'] = this.wrapperType;
    data['kind'] = this.kind;
    data['collectionId'] = this.collectionId;
    data['trackId'] = this.trackId;
    data['artistName'] = this.artistName;
    data['collectionName'] = this.collectionName;
    data['trackName'] = this.trackName;
    data['collectionCensoredName'] = this.collectionCensoredName;
    data['trackCensoredName'] = this.trackCensoredName;
    data['collectionArtistId'] = this.collectionArtistId;
    data['collectionArtistViewUrl'] = this.collectionArtistViewUrl;
    data['collectionViewUrl'] = this.collectionViewUrl;
    data['trackViewUrl'] = this.trackViewUrl;
    data['previewUrl'] = this.previewUrl;
    data['artworkUrl30'] = this.artworkUrl30;
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl100'] = this.artworkUrl100;
    data['collectionPrice'] = this.collectionPrice;
    data['trackPrice'] = this.trackPrice;
    // data['trackRentalPrice'] = this.trackRentalPrice;
    // data['collectionHdPrice'] = this.collectionHdPrice;
    // data['trackHdPrice'] = this.trackHdPrice;
    // data['trackHdRentalPrice'] = this.trackHdRentalPrice;
    data['releaseDate'] = this.releaseDate;
    data['collectionExplicitness'] = this.collectionExplicitness;
    data['trackExplicitness'] = this.trackExplicitness;
    data['trackCount'] = this.trackCount;
    data['trackNumber'] = this.trackNumber;
    data['trackTimeMillis'] = this.trackTimeMillis;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['primaryGenreName'] = this.primaryGenreName;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    data['shortDescription'] = this.shortDescription;
    data['longDescription'] = this.longDescription;
    data['hasITunesExtras'] = this.hasITunesExtras;
    data['artistId'] = this.artistId;
    data['artistViewUrl'] = this.artistViewUrl;
    data['discCount'] = this.discCount;
    data['discNumber'] = this.discNumber;
    data['isStreamable'] = this.isStreamable;
    data['collectionType'] = this.collectionType;
    data['amgArtistId'] = this.amgArtistId;
    data['copyright'] = this.copyright;
    // data['genres'] = this.genres;
    data['price'] = this.price;
    // data['genreIds'] = this.genreIds;
    data['description'] = this.description;
    // data['artistIds'] = this.artistIds;
    data['fileSizeBytes'] = this.fileSizeBytes;
    data['formattedPrice'] = this.formattedPrice;
    data['averageUserRating'] = this.averageUserRating;
    data['userRatingCount'] = this.userRatingCount;
    data['feedUrl'] = this.feedUrl;
    data['artworkUrl600'] = this.artworkUrl600;
    return data;
  }
}
