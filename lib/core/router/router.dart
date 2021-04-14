import 'package:flutter/material.dart';

import '../../data/model/item.dart';
import '../../features/detail/view/detail_screen.dart';
import '../../features/home/view/home_screen.dart';
import 'router_name.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments as Map<String, dynamic>;

    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(),
        );
        break;
      case routeDetail:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailScreen(
            item: args['item'] as Item,
          ),
        );
        break;
      default:
        return null;
    }
  }
}
