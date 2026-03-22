import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.forgot_password_title, hideBack: false),
      body: FormBuilder<Map<String, String>>(
        entity: const {'email': ''},
        builder: (context, formKey, entity) {
          return Padding(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              children: [
                const CommonText(
                  text: 'Enter your email to receive a password reset code.',
                  textAlign: TextAlign.center,
                ),
                20.height,
                CommonTextField(
                  hintText: 'Email',
                  validationType: ValidationType.validateEmail,
                  onChanged: (val) => entity['email'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: 'Send OTP',
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      appRouter.push(const OtpRoute());
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
