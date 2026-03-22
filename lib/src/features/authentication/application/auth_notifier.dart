import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/features/authentication/application/auth_state.dart';
import 'package:riverpod_tamplates/src/features/authentication/infrastructure/auth_repository.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier._,
);

class AuthNotifier extends Notifier<AuthState> {
  AuthNotifier._();
  late AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);
    return const AuthState();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.login(email, password);
    if (response.isSuccess) {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
      appRouter.replaceAll([const NavigationRoute()]);
    }
  }

  Future<void> signup(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.signup(name, email, password);
    if (response.isSuccess) {
      state = state.copyWith(isLoading: false);
      appRouter.push(const OtpRoute());
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.logout();
    if (response.isSuccess) {
      state = state.copyWith(isLoading: false, isAuthenticated: false);
      appRouter.replaceAll([const LoginRoute()]);
    }
  }

  Future<void> sendOtp(String email) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.sendOtp(email);
    if (response.isSuccess) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> verifyOtp(String code) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.verifyOtp(code);
    if (response.isSuccess) {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
      appRouter.replaceAll([const NavigationRoute()]);
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
