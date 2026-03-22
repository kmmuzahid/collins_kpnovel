import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/src/constants/app_strings.dart';
import 'package:riverpod_tamplates/src/constants/app_ui_constants.dart';
import 'package:riverpod_tamplates/src/features/profile/application/profile_notifier.dart';

@RoutePage()
class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: const CommonAppBar(title: AppStrings.edit_profile_title),
      body: FormBuilder<Map<String, String>>(
        entity: const {'name': '', 'phone': '', 'email': ''},
        builder: (context, formKey, entity) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(AppUiConstants.main_screen_padding),
            child: Column(
              children: [
                const Center(
                  child: CommonImagePicker(
                    width: 120,
                    height: 120,
                    borderRadius: 60,
                  ),
                ),
                20.height,
                CommonTextField(
                  hintText: 'Full Name',
                  validationType: ValidationType.validateRequired,
                  onChanged: (val) => entity['name'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Phone Number',
                  validationType: ValidationType.validatePhone,
                  onChanged: (val) => entity['phone'] = val,
                ),
                AppUiConstants.field_spacing.height,
                CommonTextField(
                  hintText: 'Email',
                  validationType: ValidationType.validateEmail,
                  onChanged: (val) => entity['email'] = val,
                ),
                AppUiConstants.button_spacing.height,
                CommonButton(
                  titleText: 'Save Changes',
                  isLoading: profileState.isLoading,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ref.read(profileNotifierProvider.notifier).updateProfile(
                        name: entity['name'],
                        phone: entity['phone'],
                        email: entity['email'],
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
