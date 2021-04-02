class Media {
  final String? artistName;
  final String? collectionName;
  final String? trackName;
  final String? artworkUrl;
  final String? previewUrl;

  Media(
      {this.artistName,
      this.collectionName,
      this.trackName,
      this.artworkUrl,
      this.previewUrl});


  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      trackName: json['trackName'] as String?,
      artworkUrl: json['artworkUrl100'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );
  }
}
