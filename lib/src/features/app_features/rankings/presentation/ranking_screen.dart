import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/src/features/app_features/rankings/presentation/widgets/top_voted_books.dart';

@RoutePage()
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartListLoader(
        itemCount: 30,
        topWidget: const TopVotedBooks(),
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
