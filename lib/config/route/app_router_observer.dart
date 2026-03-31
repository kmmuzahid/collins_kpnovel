import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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

class AppRouterObserver extends AutoRouteObserver {
  String _routeName(Route? route) {
    return route?.settings.name ?? 'UnknownRoute';
  }

  String _screenFileName(Route? route) {
    final name = _routeName(route);
    return '${name.replaceAll("Route", "Screen")}.dart';
  }

  String _tabName(TabPageRoute route) {
    return '${route.name.replaceAll("Route", "Screen")}.dart';
  }

  void _log(String message) {
    debugPrint(message);
  }

  /// PUSH
  @override
  void didPush(Route route, Route? previousRoute) {
    _log(
      '${LogColor.bold}${LogColor.green}[PUSH]${LogColor.reset} '
      '${LogColor.cyan}${_routeName(route)}${LogColor.reset} '
      '← ${_routeName(previousRoute)}',
    );
  }

  /// POP
  @override
  void didPop(Route route, Route? previousRoute) {
    _log(
      '${LogColor.bold}${LogColor.yellow}[POP]${LogColor.reset} '
      '${LogColor.cyan}${_routeName(route)}${LogColor.reset} '
      '→ ${_routeName(previousRoute)}',
    );
  }

  /// REPLACE
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _log(
      '${LogColor.bold}${LogColor.magenta}[REPLACE]${LogColor.reset} '
      '${LogColor.red}${_routeName(oldRoute)}${LogColor.reset} '
      '→ ${LogColor.green}${_routeName(newRoute)}${LogColor.reset}',
    );
  }

  /// REMOVE (important for navigate cleanup)
  @override
  void didRemove(Route route, Route? previousRoute) {
    _log(
      '${LogColor.bold}${LogColor.red}[REMOVE]${LogColor.reset} '
      '${_routeName(route)}',
    );
  }

  /// TAB / NESTED ROUTE SWITCH
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _log(
      '${LogColor.bold}${LogColor.blue}[TAB INIT]${LogColor.reset} '
      '${LogColor.green}${_tabName(route)}${LogColor.reset}',
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _log(
      '${LogColor.bold}${LogColor.blue}[TAB CHANGE]${LogColor.reset} '
      '${LogColor.red}${_tabName(previousRoute)}${LogColor.reset} → ${LogColor.green}${_tabName(route)}${LogColor.reset}',
    );
  }
}
