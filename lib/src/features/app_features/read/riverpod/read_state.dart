import 'package:equatable/equatable.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/data/model/book_model.dart';

class ReadState extends Equatable {
  final BookModel? slectedBook;
  final bool isAudioPlaying;

  const ReadState({this.slectedBook, this.isAudioPlaying = false});

  ReadState copyWith({BookModel? slectedBook, bool? isAudioPlaying}) {
    return ReadState(
      slectedBook: slectedBook ?? this.slectedBook,
      isAudioPlaying: isAudioPlaying ?? this.isAudioPlaying,
    );
  }

  @override
  List<Object?> get props => [slectedBook, isAudioPlaying];
}
