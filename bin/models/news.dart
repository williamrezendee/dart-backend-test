class News {
  final int? id;
  final String title;
  final String description;
  final String image;
  final DateTime publicationDate;
  final DateTime? publicationUpdateDate;

  News(
    this.id,
    this.title,
    this.description,
    this.image,
    this.publicationDate,
    this.publicationUpdateDate,
  );

  factory News.fromJson(Map map) {
    return News(
      map['id'] ?? '', 
      map['title'], 
      map['description'], 
      map['image'], 
      DateTime.fromMicrosecondsSinceEpoch((map['publicationDate'])), 
      map['publicationUpdateDate'] != null
        ? DateTime.fromMicrosecondsSinceEpoch((map['publicationUpdateDate']))
        : null,
    );
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image
    };
  }

  @override
  String toString() {
    return 'News(id: $id, title: $title, description: $description, publication date: $publicationDate, update date: $publicationUpdateDate)';
  }
}
