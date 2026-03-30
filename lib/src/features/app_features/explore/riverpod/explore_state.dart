import 'package:riverpod_tamplates/src/features/app_features/read/data/model/book_model.dart';

class ExploreState {
  final List<BookModel> books;
  final String searchText;
  ExploreState({this.books = const [], this.searchText = ''});
  ExploreState copyWith({List<BookModel>? books, String? searchText}) {
    return ExploreState(books: books ?? this.books, searchText: searchText ?? this.searchText);
  }
}
