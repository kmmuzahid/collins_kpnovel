import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/storage/storage_service.dart';
import 'package:riverpod_tamplates/src/constants/api_endpoints.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
  (ref) => AuthRepository._(),
);

class AuthRepository {
  AuthRepository._();
  final String _authTokenKey = 'auth_token';

  Future<ResponseState<dynamic>> login(String email, String password) async {
    final response = await DioService.instance.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndpoints.login,
        method: .POST,
        jsonBody: {'email': email, 'password': password},
      ),
      responseBuilder: (data) => data,
    );

    if (response.isSuccess && response.data != null) {
      final token = response.data['token'] as String?;
      if (token != null) {
        await StorageService.instance.set('auth_token', token);
      }
    }

    return response;
  }

  Future<ResponseState<dynamic>> signup(
    String name,
    String email,
    String password,
  ) async {
    return await DioService.instance.request(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndpoints.signup,
        method: .POST,
        jsonBody: {'name': name, 'email': email, 'password': password},
      ),
      responseBuilder: (data) => data,
    );
  }

  @override
  Future<ResponseState<dynamic>> sendOtp(String email) async {
    return DioService.instance.request(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndpoints.sendOtp,
        method: .POST,
        jsonBody: {'email': email},
      ),
      responseBuilder: (data) => data,
    );
  }

  Future<ResponseState<dynamic>> verifyOtp(String code) async {
    return await DioService.instance.request(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndpoints.verifyOtp,
        method: .POST,
        jsonBody: {'code': code},
      ),
      responseBuilder: (data) => data,
    );
  }

  Future<ResponseState<dynamic>> logout() async {
    final response = await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.logout, method: .POST),
      responseBuilder: (data) => data,
    );

    if (response.isSuccess) {
      await StorageService.instance.delete(_authTokenKey);
    }

    return response;
  }

  Future<bool> isAuthenticated() async {
    final token = await StorageService.instance.get(_authTokenKey);
    if (token == null || token.isEmpty) {
      return false;
    }

    final response = await DioService.instance.request<bool>(
      input: RequestInput(
        endpoint: ApiEndpoints.checkAuth,
        method: .GET,
        headers: {'Authorization': 'Bearer $token'},
      ),
      responseBuilder: (data) => data['authenticated'] as bool? ?? false,
    );
    return response.isSuccess;
  }
}
