import 'package:flutter/material.dart';

import 'core/theme/theme_data.dart';
import 'features/home/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Online',
      theme: themeData(),
      home: HomeScreen(),
    );
  }
}
