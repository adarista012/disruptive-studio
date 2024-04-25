import 'package:disruptive_studio/app/ui/pages/coin_detail/coin_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinDetailPage extends StatelessWidget {
  const CoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CoinDetailProvider(),
      builder: (GetxController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Get.arguments[1].toString()),
          ),
          body: const Text('data'),
        );
      },
    );
  }
}
