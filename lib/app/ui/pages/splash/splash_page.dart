import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/ui/pages/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    return ChangeNotifierProvider.value(
      value: SplashProvider(SessionProvider()),
      child: Scaffold(
        body: Center(
          child: Image(
            image: const AssetImage('assets/logo.png'),
            width: width,
            height: width,
          ),
        ),
      ),
    );
  }
}
