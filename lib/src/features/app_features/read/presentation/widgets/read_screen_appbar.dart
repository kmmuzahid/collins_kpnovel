import 'package:core_kit/text/common_text.dart';
import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/constance/app_string.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/common/setting_icon_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/riverpod/read_notifier.dart';

class ReadScreenAppBar extends StatelessWidget {
  const ReadScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final readState = ref.watch(readProvider);
        return Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    CommonText(
                      text: AppString.no_book_selected,
                      fontSize: 14,
                      fontWeight: .w600,
                      textColor: context.color.buttonTextWhite,
                    ),
                    CommonText(
                      text: AppString.no_chapter_available_yet,
                      fontSize: 12,
                      fontWeight: .w400,
                      textColor: context.color.buttonTextWhite,
                    ),
                  ],
                ),

                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.list_outlined, color: context.color.buttonTextWhite),
                ),
                10.width,
                const SettingButtonWidget(),
                16.width,
              ],
            ),
            6.height,
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: LinearProgressIndicator(
                value: readState.slectedBook?.chapters.length.toDouble() ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}
