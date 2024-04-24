import 'package:disruptive_studio/app/app.dart';
import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/ui/pages/login/login_provider.dart';
import 'package:disruptive_studio/app/ui/pages/register/register.provider.dart';
import 'package:disruptive_studio/app/ui/pages/splash/splash_provider.dart';
import 'package:disruptive_studio/app/utils/inject_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injectDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()),
        ChangeNotifierProvider(
            create: (_) => SplashProvider(SessionProvider())),
        ChangeNotifierProvider(create: (_) => LoginProvider(SessionProvider())),
        ChangeNotifierProvider(
            create: (_) => RegisterProvider(SessionProvider())),
      ],
      child: const MyApp(),
    ),
  );
}
