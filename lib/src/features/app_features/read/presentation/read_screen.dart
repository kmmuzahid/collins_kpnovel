import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/presentation/widgets/action_bar_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/presentation/widgets/no_book_selected_widget.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/riverpod/read_notifier.dart';
import 'package:riverpod_tamplates/src/features/app_features/read/riverpod/read_state.dart';

@RoutePage()
class ReadScreen extends ConsumerWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readState = ref.watch(readProvider);
    return Scaffold( 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            10.height,
            const Expanded(child: NoBookSelectedWidget()),
            10.height,
            _buttons(context, readState),
            16.height,
            _actionBar(readState, context),
            5.height,
          ],
        ),
      ),
    );
  }

  ActionBarWidget _actionBar(ReadState readState, BuildContext context) {
    final isBookSelected = readState.slectedBook != null;
    final backgroundColor = isBookSelected
        ? context.color.inputBorderFocus.withValues(alpha: 0.5)
        : context.color.lightGray.withValues(alpha: 0.5);
    final iconColor = isBookSelected
        ? context.color.inputBorderFocus
        : context.color.subtext.withValues(alpha: 0.6);

    return ActionBarWidget(
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      textColor: iconColor,
    );
  }

  Row _buttons(BuildContext context, ReadState readState) {
    const inactiveGradient = LinearGradient(
      colors: [Color(0xff8f8eff), Color(0xffc2a0ff)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final previousActionOpacity =
        readState.slectedBook == null || readState.slectedBook?.selectedChapter == 0
        ? inactiveGradient
        : context.color.ctaGradientBackgroundAccent;
    final nextActionOpacity =
        readState.slectedBook == null ||
            readState.slectedBook?.selectedChapter ==
                (readState.slectedBook?.chapters.length ?? 0) - 1
        ? inactiveGradient
        : context.color.ctaGradientBackgroundAccent;
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Flexible(
          child: CommonButton(
            titleText: 'Previous',
            borderColor: context.color.bgColor,
            onTap: () {},
            buttonWidth: 130,
            prefix: Icon(Icons.arrow_back_ios_new, color: context.color.buttonTextWhite),
            gradient: previousActionOpacity,
          ),
        ),
        Flexible(
          child: CommonButton(
            titleText: 'Next',
            borderColor: context.color.bgColor,
            onTap: () {},
            buttonWidth: 130,
            suffix: Icon(Icons.arrow_forward_ios, color: context.color.buttonTextWhite),
            gradient: nextActionOpacity,
          ),
        ),
      ],
    );
  }

}
