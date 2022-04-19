import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_cart/layarmasuk.dart';
import 'boxes.dart';
import 'keranjang.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Item>(HiveBoxes.cart);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login_screen(),
    );
  }
}