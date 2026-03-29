import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogColor {
  static const reset = '\x1B[0m';
  static const bold = '\x1B[1m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const cyan = '\x1B[36m';
}

final class AppProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    print(
      '${LogColor.green}${LogColor.bold}Added${LogColor.reset}: '
      '${LogColor.cyan}${context.provider.name ?? context.provider.runtimeType}${LogColor.reset}, '
      'value type: ${LogColor.yellow}${value.runtimeType}${LogColor.reset}',
    );
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    print(
      '${LogColor.blue}${LogColor.bold}Updated${LogColor.reset}: '
      '${LogColor.cyan}${context.provider.name ?? context.provider.runtimeType}${LogColor.reset}, '
      'old: ${LogColor.red}${previousValue.runtimeType}${LogColor.reset}, '
      'new: ${LogColor.green}${newValue.runtimeType}${LogColor.reset}',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    print(
      '${LogColor.magenta}${LogColor.bold}Disposed${LogColor.reset}: '
      '${LogColor.cyan}${context.provider.name ?? context.provider.runtimeType}${LogColor.reset}',
    );
  }
}
