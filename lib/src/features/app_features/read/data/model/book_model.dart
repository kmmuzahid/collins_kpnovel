class BookModel {
  final String? id;
  final String? title;
  final String? description;
  final String? coverImage;
  final String? author;
  final String? genre;
  final String? language;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final List<BookChapter> chapters;
  final int selectedChapter;

  BookModel({
    this.id,
    this.title,
    this.description,
    this.coverImage,
    this.author,
    this.genre,
    this.language,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.chapters = const [],
    this.selectedChapter = 0,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    coverImage: json["cover_image"],
    author: json["author"],
    genre: json["genre"],
    language: json["language"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    chapters: json["chapters"] == null
        ? []
        : List<BookChapter>.from(json["chapters"]!.map((x) => BookChapter.fromJson(x))),
    selectedChapter: json["selected_chapter"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "cover_image": coverImage,
    "author": author,
    "genre": genre,
    "language": language,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "chapters": List<dynamic>.from(chapters.map((x) => x)),
    "selected_chapter": selectedChapter,
  };

  BookModel copyWith({
    String? id,
    String? title,
    String? description,
    String? coverImage,
    String? author,
    String? genre,
    String? language,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<BookChapter>? chapters,
    int? selectedChapter,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      language: language ?? this.language,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      chapters: chapters ?? this.chapters,
      selectedChapter: selectedChapter ?? this.selectedChapter,
    );
  }
}

class BookChapter {
  final String? id;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;

  BookChapter({this.id, this.title, this.content, this.createdAt, this.updatedAt});

  factory BookChapter.fromJson(Map<String, dynamic> json) => BookChapter(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
