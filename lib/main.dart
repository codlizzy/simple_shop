import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shop/controller/item_list_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ItemListController controller = Get.put(ItemListController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              'فروشگاه من',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              Text(
                'درباره ما',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                ' ارتباط با ما',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            leading: Icon(
              Icons.shopping_bag,
              color: Colors.white,
              size: 27,
            ),
          ),
          body: Obx(() {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.itemCount.value,
                itemBuilder: (context, index) {
                  var item = controller.data[index];
                  return Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          height: 200,
                          margin: EdgeInsets.all(8.0),
                          width: 220,
                          child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                  item['picture'],
                                  height: 150,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(item['price'].toString()),
                                  Text(item['name']),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          })),
    );
  }
}
