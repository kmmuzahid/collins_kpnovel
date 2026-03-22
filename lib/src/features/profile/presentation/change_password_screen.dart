import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';
import 'package:riverpod_tamplates/src/features/profile/application/profile_notifier.dart';

@RoutePage()
class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.change_password_title),
      body: FormBuilder<Map<String, String>>(
        entity: const {'old': '', 'new': '', 'confirm': ''},
        builder: (context, formKey, entity) {
          return Padding(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              children: [
                CommonTextField(
                  hintText: 'Current Password',
                  validationType: ValidationType.validatePassword,
                  onChanged: (val) => entity['old'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'New Password',
                  validationType: ValidationType.validatePassword,
                  onChanged: (val) => entity['new'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Confirm New Password',
                  validationType: ValidationType.validatePassword,
                  onChanged: (val) => entity['confirm'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: AppStrings.change_password_title,
                  isLoading: profileState.isLoading,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ref.read(profileNotifierProvider.notifier).changePassword(
                        entity['old']!,
                        entity['new']!,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
