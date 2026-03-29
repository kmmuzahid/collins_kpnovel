import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tamplates/config/constance/enums.dart';
import 'package:riverpod_tamplates/src/features/app_features/contest/riverpod/constest_state.dart';

part 'contest_notifier.g.dart';

@Riverpod()
class ContestNotifier extends _$ContestNotifier {
  @override
  ContestState build(ContestType contestType) {
    return ContestState();
  }
}

@riverpod
class SelectedContest extends _$SelectedContest {
  @override
  SelectedContestState build() {
    final booksScrollController = ScrollController();
    final writersScrollController = ScrollController();
    ref.onDispose(() {
      booksScrollController.dispose();
      writersScrollController.dispose();
    });
    return SelectedContestState(
      contestType: ContestType.Writers,
      booksScrollController: booksScrollController,
      writersScrollController: writersScrollController,
    );
  }

  void setContest(ContestType value) {
    state = SelectedContestState(
      contestType: value,
      booksScrollController: state.booksScrollController,
      writersScrollController: state.writersScrollController,
    );
  }
}

class SelectedContestState with EquatableMixin {
  final ContestType contestType;
  final ScrollController booksScrollController;
  final ScrollController writersScrollController;

  SelectedContestState({
    required this.contestType,
    required this.booksScrollController,
    required this.writersScrollController,
  });

  @override
  List<Object?> get props => [contestType, booksScrollController, writersScrollController];
}
