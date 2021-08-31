import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/http_not_found_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/stateful':
        return _fadeRoute(CounterPage(), '/stateful');
      case '/provider':
        return _fadeRoute(CounterProviderPage(), '/provider');
      default:
        return _fadeRoute(HttpNotFoundPage(), '/404');
    }
  }

  /// Build a [PageRoute] with an animation on [child] transition and
  /// add the [routeName] to URI
  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (_, animation, __, ___) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
