import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'core/router/router_name.dart';
import 'core/theme/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Online',
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: routeHome,
    );
  }
}
