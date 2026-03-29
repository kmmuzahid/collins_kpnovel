import 'package:riverpod_tamplates/src/features/app_features/contest/data/model/contest_item.dart';

class ContestState {
  List<ContestItem> contestItems;
  ContestState({this.contestItems = const []});

  ContestState copyWith({List<ContestItem>? contestItems}) {
    return ContestState(contestItems: contestItems ?? this.contestItems);
  }
}
