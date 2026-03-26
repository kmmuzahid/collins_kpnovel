import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/features/core_features/authentication/riverpod/auth_notifier.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.profile_title, hideBack: true),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: CommonText(text: 'John Doe', textColor: Colors.white),
            accountEmail: CommonText(text: 'john.doe@example.com', textColor: Colors.white70),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.blue),
            title: const CommonText(text: AppStrings.edit_profile_title),
            onTap: () => appRouter.push(const EditProfileRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.orange),
            title: const CommonText(text: AppStrings.change_password_title),
            onTap: () => appRouter.push(const ChangePasswordRoute()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description, color: Colors.grey),
            title: const CommonText(text: 'Terms & Conditions'),
            onTap: () => appRouter.push(const TermsRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.grey),
            title: const CommonText(text: 'Privacy Policy'),
            onTap: () => appRouter.push(const PrivacyRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.grey),
            title: const CommonText(text: 'FAQ'),
            onTap: () => appRouter.push(const FaqRoute()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const CommonText(text: 'Logout', textColor: Colors.red),
            onTap: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
    );
  }
}
