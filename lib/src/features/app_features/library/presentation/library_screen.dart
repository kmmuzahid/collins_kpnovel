import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:core_kit/list_loader/smart_tab_list_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/constance/enums.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/features/app_features/library/presentation/widgets/book_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/library/presentation/widgets/no_books_found.dart';
import 'package:riverpod_tamplates/src/features/app_features/library/riverpod/library_notifire.dart';

@RoutePage()
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Consumer(
        builder: (context, ref, _) {
          final selectedLibrary = ref.watch(selectedLibraryProvider);
          final selectedLibraryNotifier = ref.read(selectedLibraryProvider.notifier);
          return Column(
            children: [
              _header(context, selectedLibraryNotifier, selectedLibrary),
              Expanded(
                child: SmartTabListLoader(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  tabs: const [
                    SmartTabConfig(tab: LibrayType.Reading, itemCount: 20),
                    SmartTabConfig(tab: LibrayType.Completed, itemCount: 0),
                    SmartTabConfig(tab: LibrayType.WantToRead, itemCount: 40),
                    SmartTabConfig(tab: LibrayType.Paused, itemCount: 40),
                  ],
                  itemBuilder: (ctx, index) {
                    return const BookWidget();
                  },
                  value: selectedLibrary,
                  gridConfig: GridConfig(
                    itemInRow: 2,
                    aspectRatio: .68,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  emptyWidget: const NoBooksFoundWidget(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _header(
    BuildContext context,
    SelectedLibrary selectedLibraryNotifire,
    LibrayType selectedLibray,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          10.height,
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              CommonText(text: AppString.my_library, fontSize: 18, fontWeight: .bold),
              CommonText(
                text: AppString.hide_profile,
                fontSize: 14,
                textColor: context.color.ctaButtonsText,
                fontWeight: .bold,
              ),
            ],
          ),
          10.height,
          _tabBuilder(selectedLibraryNotifire, selectedLibray, context),
          10.height,
        ],
      ),
    );
  }

  Widget _tabBuilder(
    SelectedLibrary selectedLibraryNotifire,
    LibrayType selectedLibray,
    BuildContext context,
  ) {
    final tabs = LibrayType.values.map((e) {
      IconData icon;
      switch (e) {
        case LibrayType.Reading:
          icon = Icons.menu_book_outlined;
          break;
        case LibrayType.Completed:
          icon = Icons.check_circle_outline;
          break;
        case LibrayType.WantToRead:
          icon = Icons.star_outline;
          break;
        case LibrayType.Paused:
          icon = Icons.access_time_outlined;
          break;
      }
      return _tabItem(
        type: e,
        count: 10,
        context: context,
        prefixIcon: icon,
        onTap: () {
          selectedLibraryNotifire.setLibrary(e);
        },
        selectedType: selectedLibray,
      );
    }).toList();

    return SizedBox(
      key: const ValueKey('tab_builder'),
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Row(children: tabs),
      ),
    );
  }

  Widget _tabItem({
    required LibrayType type,
    required int count,
    required LibrayType selectedType,
    Function()? onTap,
    required BuildContext context,
    required IconData prefixIcon,
  }) {
    final isSelected = selectedType == type;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          border: isSelected
              ? null
              : Border.all(width: 1.2.w, color: context.color.subtleOverlaysShadows),
          borderRadius: BorderRadius.circular(40.r),

          color: !isSelected ? context.color.bgColor : null,
          gradient: isSelected ? context.color.ctaGradientBackgroundAccent : null,
        ),
        child: CommonText(
          text: type.name,
          suffix: CommonText(
            text: '($count)',
            fontSize: 16,
            fontWeight: .w500,
            textColor: isSelected ? context.color.buttonTextWhite : context.color.subtext,
          ),
          fontSize: 16,
          fontWeight: .w500,
          textColor: isSelected ? context.color.buttonTextWhite : context.color.subtext,
          preffix: Icon(
            prefixIcon,
            color: isSelected ? context.color.buttonTextWhite : context.color.subtext,
          ),
        
        ),
      ),
    );
  }
}
