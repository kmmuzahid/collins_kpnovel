import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';
import 'package:riverpod_tamplates/src/features/core_features/authentication/riverpod/auth_notifier.dart';

@RoutePage()
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: const CommonAppBar(title: AppStringsCore.signup_title, hideBack: false),
      body: FormBuilder<Map<String, String>>(
        entity: const {'name': '', 'email': '', 'password': ''},
        builder: (context, formKey, entity) {
          return Padding(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              children: [
                CommonTextField(
                  hintText: 'Full Name',
                  validationType: ValidationType.validateRequired,
                  onSaved: (val, _) => entity['name'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Email',
                  validationType: ValidationType.validateEmail,
                  onSaved: (val, _) => entity['email'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Password',
                  validationType: ValidationType.validatePassword,
                  onSaved: (val, _) => entity['password'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: AppStringsCore.signup_title,
                  isLoading: authState.isLoading,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      authNotifier.signup(entity['name']!, entity['email']!, entity['password']!);
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
