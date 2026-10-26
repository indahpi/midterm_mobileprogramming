import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_model.dart';
import '../widgets/custom_text.dart';
import 'menu_add_view.dart';
import 'menu_detail_view.dart';

class MenuListView extends StatefulWidget {
  const MenuListView({super.key});

  @override
  State<MenuListView> createState() => _MenuListViewState();
}

class _MenuListViewState extends State<MenuListView> {
  final List<MenuModel> _menuList = [
    MenuModel(name: 'Nasi Bakar Cumi', price: '16000'),
    MenuModel(name: 'Cireng Kuah Creamy', price: '10000'),
    MenuModel(name: 'Dimsum Bakar', price: '15000'),
    MenuModel(name: 'Air Mineral', price: '5000'),
    MenuModel(name: 'Jus Mangga', price: '9000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Kantin Kita", fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomText(
              text: "Daftar Menu Makanan & Minuman",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menuList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.teal.shade100, width: 1.5),
                  ),
                  child: ListTile(
                    onTap: () async {
                      await Get.to(() => MenuDetailView(menuData: _menuList[index]));
                    },
                    leading: const Icon(Icons.local_dining, color: Colors.teal),
                    title: CustomText(text: _menuList[index].name, fontSize: 15, fontWeight: FontWeight.bold),
                    subtitle: CustomText(text: "Rp ${_menuList[index].price}", fontSize: 13, color: Colors.grey.shade700),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.teal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () async {
          final result = await Get.to(() => const MenuAddView());
          if (result != null && result is MenuModel) {
            setState(() {
              _menuList.add(result);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}