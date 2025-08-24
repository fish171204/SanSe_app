class AffiliateItem {
  final String image;
  final String title;
  final String? url;

  const AffiliateItem({
    required this.image,
    required this.title,
    this.url,
  });

  factory AffiliateItem.fromMap(Map<String, String> map) {
    return AffiliateItem(
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
    return other is AffiliateItem &&
        other.image == image &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'AffiliateItem(image: $image, title: $title, url: $url)';
  }
}
