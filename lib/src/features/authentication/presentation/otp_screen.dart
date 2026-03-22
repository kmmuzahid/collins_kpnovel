import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';
import 'package:riverpod_tamplates/src/features/authentication/application/auth_notifier.dart';

@RoutePage()
class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.verify_otp_title),
      body: FormBuilder<Map<String, String>>(
        entity: const {'otp': ''},
        builder: (context, formKey, entity) {
          return Padding(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              children: [
                const CommonText(
                  text: 'Enter the 6-digit code sent to your email.',
                  textAlign: TextAlign.center,
                ),
                30.height,
                CommonTextField(
                  hintText: 'OTP Code',
                  validationType: ValidationType.validateOTP,
                  maxLength: 6,
                  onChanged: (val) => entity['otp'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: 'Verify',
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .verifyOtp(entity['otp'] ?? '');
                    }
                  },
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CommonText(text: 'Didn\'t receive the code? '),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(authNotifierProvider.notifier)
                            .sendOtp('user@example.com');
                      },
                      child: const CommonText(
                        text: 'Resend Now',
                        textColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
