import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/http_not_found_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/stateful':
        return MaterialPageRoute(builder: (_) => CounterPage());
      case '/provider':
        return MaterialPageRoute(builder: (_) => CounterProviderPage());
      default:
        return MaterialPageRoute(builder: (_) => HttpNotFoundPage());
    }
  }
}
