import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/menu_list_view.dart';

void main() {
  runApp(const KantinKitaApp());
}

class KantinKitaApp extends StatelessWidget {
  const KantinKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Kita',
      home: MenuListView(),
    );
  }
}