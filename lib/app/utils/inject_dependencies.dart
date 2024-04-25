import 'package:disruptive_studio/app/data/repositories_impl/api_repository_impl.dart';
import 'package:disruptive_studio/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:disruptive_studio/app/domain/repositories/api_repository.dart';
import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/ui/pages/coin_detail/coin_detail_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';

Future<void> injectDependencies() async {
  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
    ),
    fenix: true,
  );
  Get.lazyPut<SessionProvider>(
    () => SessionProvider(),
    fenix: true,
  );
  Get.lazyPut<ApiRepository>(
    () => ApiRepositoryImpl(),
    fenix: true,
  );
  Get.lazyPut(() => CoinDetailProvider());
}
