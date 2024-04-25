import 'package:disruptive_studio/app/domain/repositories/api_repository.dart';
import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProvider with ChangeNotifier {
  final List<Widget> _listCoinsUi = [];
  List<Widget> get listCoinsUi => _listCoinsUi;

  HomeProvider() {
    _init();
  }

  final _apiRepository = Get.find<ApiRepository>();

  Future _init() async {
    _apiRepository.getPrices().listen((event) {
      final String s = event.symbol.substring(0, event.symbol.length - 4);

      _listCoinsUi.add(
        MaterialButton(
          onPressed: () {
            Get.toNamed(Routes.COIN_DETAIL,
                arguments: [event.symbol, '$s-USD']);
          },
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              '$s-USD',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(event.price.toString()),
                Text(
                  event.priceChange.toString(),
                  style: TextStyle(
                    color:
                        event.priceChange > 0 ? AppColors.green : AppColors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      notifyListeners();
    }, onDone: () => {});
  }
}
