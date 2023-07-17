import 'package:flutter/material.dart';

import 'router/router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: _appRouter.config(),
    );
  }
}
