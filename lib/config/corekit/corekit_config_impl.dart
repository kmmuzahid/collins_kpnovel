import 'package:core_kit/initializer.dart';
import 'package:core_kit/network/dio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_tamplates/config/theme/extension/app_colors.dart';

class CorekitConfigImpl extends CoreKitConfig with CoreKitConfigDefaults {

  @override
  Widget get preInitChild {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.light().ctaGradientBackgroundAccent),
    );
  }

  @override
  Size get designSize => const Size(393, 852);
   
  @override
  DioServiceConfig get dioConfig =>
      DioServiceConfig(baseUrl: '', refreshTokenEndpoint: '');

  @override
  String get imageBaseUrl => '';

  @override
  TokenProvider get tokenProvider => TokenProvider(
    accessToken: () async => '',
    refreshToken: () async => '',
    updateTokens: (data) async {},
  );
}
