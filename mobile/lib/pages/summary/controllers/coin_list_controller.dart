import 'package:get/get.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/service/coin_service.dart';

class CoinListController extends GetxController {
  List<Coin> coinList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCoinList();
    super.onInit();
  }

  void fetchCoinList() async {
    coinList = await CoinService().fetchCoinList();
    update();
  }
}
