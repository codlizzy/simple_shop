import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

class ItemListController extends GetxController {
  var data = <Map<String, dynamic>>[].obs;
  var itemCount = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getItemListAPI();
  }

  void getItemListAPI() async {
    try {
      final response = await get(
        Uri.parse('http://192.168.1.4:8001/api/items_list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> rData = jsonDecode(utf8.decode(response.bodyBytes));
        data.value = rData.cast<Map<String, dynamic>>();
        itemCount.value = data.length;
      }
    } catch (e) {
      print(e);
    }
  }
}
