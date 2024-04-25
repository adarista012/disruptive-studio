import 'package:disruptive_studio/app/domain/repositories/api_repository.dart';
import 'package:get/get.dart';

class CoinDetailProvider extends GetxController {
  List<List> list = [];
  final String _hello = 'Hello World';
  String get hello => _hello;
  CoinDetailProvider() {
    print('init detail');
    _init();
  }
  final _apiRepository = Get.find<ApiRepository>();
  void _init() async {
    _apiRepository.getKline(Get.arguments[0]).listen(
      (data) {
        print(data);
        list.add(data);
        update();
      },
    );
  }
}
