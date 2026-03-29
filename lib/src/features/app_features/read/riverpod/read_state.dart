import 'package:equatable/equatable.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/data/model/book_model.dart';

class ReadState extends Equatable {
  final BookModel? slectedBook;

  const ReadState({this.slectedBook});

  ReadState copyWith({BookModel? slectedBook}) {
    return ReadState(slectedBook: slectedBook ?? this.slectedBook);
  }

  @override
  List<Object?> get props => [slectedBook];
}
