import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/ui/pages/splash.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
  };
}
