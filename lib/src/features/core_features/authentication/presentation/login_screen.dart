import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';
import 'package:riverpod_tamplates/src/features/core_features/authentication/riverpod/auth_notifier.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.login_title, hideBack: true),
      body: FormBuilder<Map<String, String>>(
        entity: const {'email': '', 'password': ''},
        builder: (context, formKey, entity) {
          return Padding(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextField(
                  hintText: 'Email',
                  validationType: ValidationType.validateEmail,
                  onChanged: (val) => entity['email'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Password',
                  validationType: ValidationType.validatePassword,
                  onChanged: (val) => entity['password'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: AppStrings.login_title,
                  isLoading: authState.isLoading,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      authNotifier.login(entity['email']!, entity['password']!);
                    }
                  },
                ),
                10.height,
                TextButton(
                  onPressed: () => appRouter.push(const SignupRoute()),
                  child: const CommonText(text: 'Don\'t have an account? Signup'),
                ),
                TextButton(
                  onPressed: () => appRouter.push(const ForgotPasswordRoute()),
                  child: const CommonText(text: 'Forgot Password?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
