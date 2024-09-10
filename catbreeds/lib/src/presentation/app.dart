import 'package:catbreeds/src/presentation/components/theme/app_theme.dart';
import 'package:catbreeds/src/presentation/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
      theme: cbLightAppTheme,
    );
  }
}