import 'package:core_kit/initializer.dart';
import 'package:core_kit/network/dio_service.dart';

class CorekitConfigImpl extends CoreKitConfig with CoreKitConfigDefaults {
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
