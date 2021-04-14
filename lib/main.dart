import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'core/router/router_name.dart';
import 'core/theme/theme_data.dart';
import 'data/dummy.dart';
import 'features/home/bloc/home_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(items),
      child: MaterialApp(
        title: 'Toko Online',
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().onGenerateRoute,
        initialRoute: routeHome,
      ),
    );
  }
}
