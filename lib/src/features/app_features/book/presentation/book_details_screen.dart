import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/src/features/app_features/book/presentation/widgets/book_details_appbar_widget.dart';

@RoutePage()
class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        disableBack: true,
        hideBack: true,
        titleWidget: const BookDetailsAppbarWidget(),
        appbarConfig: AppbarConfig(height: 165.h),
      ),
    );
  }
}
