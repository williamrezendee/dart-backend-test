class News {
  final int id;
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

  @override
  String toString() {
    return 'News(id: $id, title: $title, description: $description, publication date: $publicationDate, update date: $publicationUpdateDate)';
  }
}
