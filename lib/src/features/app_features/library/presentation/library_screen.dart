import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:core_kit/list_loader/smart_tab_list_loader.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/constance/enums.dart';
import 'package:riverpod_tamplates/src/features/app_features/library/presentation/widgets/library_item_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/library/presentation/widgets/library_profile_header.dart';

@RoutePage()
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        disableBack: true,
        hideBack: true,
        titleWidget: const LibraryProfileHeader(),
        appbarConfig: AppbarConfig(height: 145.h),
      ),
      body: SmartTabListLoader(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        tabs: const [
          SmartTabConfig(tab: LibrayType.Reading, itemCount: 20),
          SmartTabConfig(tab: LibrayType.Completed, itemCount: 30),
          SmartTabConfig(tab: LibrayType.WantToRead, itemCount: 40),
        ],
        itemBuilder: (ctx, index) {
          return const LibraryItemWidget();
        },
        value: LibrayType.Reading,
        gridConfig: GridConfig(
          itemInRow: 2,
          aspectRatio: .68,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
      ),
    );
  }
}
