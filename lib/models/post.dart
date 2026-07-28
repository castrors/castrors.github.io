class Post {
  final String id;
  final String slug;
  final String title;
  final String category;
  final String date;
  final String summary;
  final String bodyMarkdown;
  final String imageUrl;
  final String readingTime;
  final bool isFeatured;

  const Post({
    required this.id,
    required this.slug,
    required this.title,
    required this.category,
    required this.date,
    required this.summary,
    required this.bodyMarkdown,
    required this.imageUrl,
    required this.readingTime,
    this.isFeatured = false,
  });
}
