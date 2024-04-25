import 'package:disruptive_studio/app/data/models/coin_price.dart';
import 'package:disruptive_studio/app/domain/repositories/api_repository.dart';
import 'package:dio/dio.dart';

class ApiRepositoryImpl extends ApiRepository {
  final dio = Dio();
  @override
  Stream<CoinPrice> getPrices() async* {
    final response =
        await dio.get('https://www.binance.com/api/v3/ticker/price');
    if (response.statusCode == 200) {
      final List listResponse = response.data;
      var counter = 0;
      for (final e in listResponse) {
        if (counter < 20) {
          if (e['symbol'].toString().endsWith('USD')) {
            final response = await dio.get(
                'https://www.binance.com/api/v3/ticker/24hr?symbol=${e['symbol'].toString()}');
            final j = response.data;
            yield CoinPrice(
              symbol: e['symbol'] as String,
              price: double.parse(e['price'].toString()),
              priceChange: double.parse(j["priceChange"].toString()),
            );
            counter += 1;
          }
        }
      }
    }
  }
}
