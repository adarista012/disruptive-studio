import 'package:disruptive_studio/app/ui/providers/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: SplashProvider(),
      child: Scaffold(
        body: Center(
          child: Text('Splash Page'),
        ),
      ),
    );
  }
}
