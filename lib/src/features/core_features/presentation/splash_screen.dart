import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/src/features/core_features/authentication/data/auth_repository.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late AuthRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = ref.read(authRepositoryProvider);
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final isAuthenticated = await _repository.isAuthenticated();

    if (!mounted) return;

    if (isAuthenticated) {
      appRouter.replace(const NavigationRoute());
    } else {
      appRouter.replace(const OnboardingRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flash_on, size: 80, color: Colors.blue),
            20.height,
            const CommonText(text: 'Riverpod Template', fontSize: 24, fontWeight: FontWeight.bold),
            10.height,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
