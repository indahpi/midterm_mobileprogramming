import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/custom_text.dart';

class MenuDetailView extends StatelessWidget {
  final MenuModel menuData;

  const MenuDetailView({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Detail Menu", fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.teal,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shadowColor: Colors.teal.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.fastfood, size: 48, color: Colors.teal),
                  ),
                  const SizedBox(height: 20),
                  
                  const CustomText(text: "MENU KANTIN KITA", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                  const SizedBox(height: 8),
                  
                  CustomText(
                    text: menuData.name,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                  const SizedBox(height: 16),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomText(
                      text: "Rp ${menuData.price}",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}