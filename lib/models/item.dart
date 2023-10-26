class Item {
  final String id;
  final String title;
  final String? description;
  final String? thumbnailUrl;
  final int priceInCents;

  const Item({required this.id, required this.title, this.description, this.thumbnailUrl, required this.priceInCents});

  double getPrice() {
    return priceInCents / 100;
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['ref'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnail'] as String?,
      priceInCents: json['price'] as int,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is Item && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
