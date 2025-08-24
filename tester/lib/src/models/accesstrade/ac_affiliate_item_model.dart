class AffiliateItemModel {
  final String image;
  final String title;
  final String? url;

  const AffiliateItemModel({
    required this.image,
    required this.title,
    this.url,
  });

  factory AffiliateItemModel.fromMap(Map<String, String> map) {
    return AffiliateItemModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      url: map['url'],
    );
  }

  Map<String, String> toMap() {
    return {
      'image': image,
      'title': title,
      if (url != null) 'url': url!,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AffiliateItemModel &&
        other.image == image &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'AffiliateItemModel(image: $image, title: $title, url: $url)';
  }
}
