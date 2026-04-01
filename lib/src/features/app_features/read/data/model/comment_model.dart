class Comment {
  final String author;
  final String content;
  final String timeAgo;
  final int likes;
  final bool isReply;

  Comment({
    required this.author,
    required this.content,
    required this.timeAgo,
    required this.likes,
    this.isReply = false,
  });
}
