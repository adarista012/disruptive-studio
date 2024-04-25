import 'package:disruptive_studio/app/data/models/coin_price.dart';

abstract class ApiRepository {
  Stream<CoinPrice> getPrices();
  Stream<List> getKline(String symbol);
}
