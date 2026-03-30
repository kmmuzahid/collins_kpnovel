import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/presentation/widgets/explore_inital_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/presentation/widgets/explore_result_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/explore/riverpod/explore_notifire.dart';

@RoutePage()
class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreNotifireProvider); 

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: state.searchText.isNotEmpty
            ? const ExploreResultWidget()
            : const ExploreInitalWidget(),
      ),
    );
  }



}



