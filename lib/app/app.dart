import 'package:disruptive_studio/app/routes/app_routes.dart';
import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.nameOfApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
      initialRoute: Routes.SPLASH,
    );
  }
}
