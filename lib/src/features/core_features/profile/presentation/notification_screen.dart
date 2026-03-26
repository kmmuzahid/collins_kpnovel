import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';

@RoutePage()
class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStringsCore.notifications_title),
      body: SmartListLoader(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.blue),
            title: CommonText(text: 'Notification #$index'),
            subtitle: const CommonText(text: 'This is a sample notification message.', textColor: Colors.grey),
            trailing: const CommonText(text: '2m ago', fontSize: 12),
          );
        },
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        onLoadMore: (page) async {
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
    );
  }
}
