import 'package:disruptive_studio/app/app.dart';
import 'package:disruptive_studio/app/ui/providers/splash.dart';
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
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
