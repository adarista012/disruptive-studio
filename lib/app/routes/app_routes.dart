import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/ui/pages/home/home_page.dart';
import 'package:disruptive_studio/app/ui/pages/login/login_page.dart';
import 'package:disruptive_studio/app/ui/pages/register/register_page.dart';
import 'package:disruptive_studio/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.LOGIN: (_) => const LoginPage(),
  };
}
