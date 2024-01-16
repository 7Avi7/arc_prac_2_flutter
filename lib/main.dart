import 'package:architec_practice2/ui/route_navigation.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architec Practice 2',
      initialRoute: RouteNavigation.signIn,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
