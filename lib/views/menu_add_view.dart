import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_model.dart';
import '../widgets/custom_text.dart';

class MenuAddView extends StatefulWidget {
  const MenuAddView({super.key});

  @override
  State<MenuAddView> createState() => _MenuAddViewState();
}

class _MenuAddViewState extends State<MenuAddView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Tambah Menu Baru", fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.teal,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Menu',
                  prefixIcon: const Icon(Icons.local_dining, color: Colors.teal),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kolom nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga Menu',
                  prefixIcon: const Icon(Icons.attach_money, color: Colors.teal),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kolom harga tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Kolom harga hanya menerima angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    MenuModel newMenu = MenuModel(
                      name: _nameController.text,
                      price: _priceController.text,
                    );
                    Get.back(result: newMenu);
                  }
                },
                child: const CustomText(text: "Simpan Menu", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}