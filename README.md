# Flutter Riverpod Production Template

A production-ready Flutter template with Clean Architecture, Riverpod state management, and enterprise-grade patterns.

## Features

- **Clean Architecture** - Separation of concerns with domain, application, and infrastructure layers
- **Riverpod State Management** - Modern, type-safe state management with dependency injection
- **Auto Route Navigation** - Type-safe routing with code generation
- **CoreKit Integration** - Pre-built networking, storage, and UI components
- **Token-based Authentication** - Secure token storage with automatic routing
- **Production Patterns** - Repository pattern, provider injection, error handling

## Architecture

```
lib/
├── config/                 # App configuration
│   ├── route/             # AutoRoute configuration
│   ├── theme/             # Theme data
│   └── corekit/           # CoreKit configuration
├── src/
│   ├── constants/         # App constants (colors, strings, endpoints)
│   ├── features/          # Feature modules
│   │   ├── authentication/    # Auth feature
│   │   │   ├── domain/       # Interfaces
│   │   │   ├── application/  # Notifiers
│   │   │   ├── infrastructure/ # Repository implementation
│   │   │   └── presentation/   # Screens
│   │   ├── profile/          # Profile feature
│   │   ├── home/            # Home feature
│   │   ├── navigation/      # Bottom navigation
│   │   ├── splash/         # Splash screen
│   │   └── onboarding/     # Onboarding flow
│   └── utils/              # Utilities
└── main.dart              # Entry point
```

## Key Patterns

### Dependency Injection
```dart
final authRepositoryProvider = Provider.autoDispose<AuthRepositoryInterface>(
  (ref) => _AuthRepository()
);

class _AuthNotifier extends Notifier<AuthState> {
  late final AuthRepositoryInterface _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);
    return const AuthState();
  }
}
```

### Repository Pattern with CoreKit
```dart
class _AuthRepository implements AuthRepositoryInterface {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Future<ResponseState<dynamic>> login(String email, String password) async {
    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.login,
        method: RequestMethod.post,
        jsonBody: {'email': email, 'password': password},
      ),
      responseBuilder: (data) => data,
    );

    if (response.isSuccess && response.data != null) {
      final token = response.data['token'] as String?;
      if (token != null) {
        await _secureStorage.set('auth_token', token);
      }
    }

    return response;
  }
}
```

### State Management
```dart
Future<void> login(String email, String password) async {
  state = state.copyWith(isLoading: true, error: null);
  
  final response = await _repository.login(email, password);
  if (response.isSuccess) {
    state = state.copyWith(isLoading: false, isAuthenticated: true);
    appRouter.replaceAll([const NavigationRoute()]);
  } else {
    state = state.copyWith(isLoading: false, error: response.error);
  }
}
```

## Setup

### Prerequisites
- Flutter SDK ^3.11.1
- Dart SDK ^3.11.1
- CoreKit package (local dependency)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd riverpod_tamplates
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run code generation:
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

## Dependencies

### Core
- `flutter_riverpod` - State management
- `auto_route` - Navigation
- `core_kit` - Networking, storage, UI components

### Dev Dependencies
- `build_runner` - Code generation
- `auto_route_generator` - Route generation
- `core_kit_lints` - Custom lint rules

## Features Included

### Authentication
- Login with email/password
- User signup
- OTP verification
- Password reset
- Token-based session management
- Automatic routing based on auth state

### Profile
- View profile
- Edit profile
- Change password
- Terms & Conditions
- Privacy Policy
- FAQ

### Navigation
- Bottom navigation with 3 tabs
- Deep linking support
- Route guards

## API Configuration

Update `lib/src/constants/api_endpoints.dart`:

```dart
class ApiEndpoints {
  static const String baseUrl = 'https://your-api.com';
  static const String login = '$baseUrl/auth/login';
  static const String signup = '$baseUrl/auth/signup';
  // ... other endpoints
}
```

## State Management Guide

### Creating a New Feature

1. **Define Repository Interface** (`domain/`)
```dart
abstract class FeatureRepositoryInterface {
  Future<ResponseState<dynamic>> doSomething();
}
```

2. **Implement Repository** (`infrastructure/`)
```dart
final featureRepositoryProvider = Provider.autoDispose<FeatureRepositoryInterface>(
  (ref) => _FeatureRepository()
);

class _FeatureRepository implements FeatureRepositoryInterface {
  @override
  Future<ResponseState<dynamic>> doSomething() async {
    return await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.feature),
      responseBuilder: (data) => data,
    );
  }
}
```

3. **Create Notifier** (`application/`)
```dart
final featureNotifierProvider = NotifierProvider<_FeatureNotifier, FeatureState>(_FeatureNotifier.new);

class _FeatureNotifier extends Notifier<FeatureState> {
  late final FeatureRepositoryInterface _repository;

  @override
  FeatureState build() {
    _repository = ref.read(featureRepositoryProvider);
    return const FeatureState();
  }
}
```

4. **Create Screen** (`presentation/`)
```dart
@RoutePage()
class FeatureScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(featureNotifierProvider);
    // ...
  }
}
```

## Token Management

The app uses secure storage for token management:

- **Login**: Token is saved to `SecureStorage`
- **Logout**: Token is deleted from `SecureStorage`
- **App Launch**: Splash screen checks token and routes accordingly
- **API Calls**: Token is automatically added to authenticated requests

## Best Practices

- Use `autoDispose` for providers that don't need to stay alive
- Use `isSuccess` instead of `hasError` for response checking
- Keep repository as class-level variable initialized in `build()`
- Use package imports (`package:riverpod_tamplates/...`) instead of relative imports
- Sort imports alphabetically by package name

## Testing

Run tests:
```bash
flutter test
```

## Building

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## License

MIT License - feel free to use for your projects.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

Built with ❤️ using Flutter and Riverpod
